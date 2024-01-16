//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 16.01.24.
//

import Foundation
import JSONCoder
import NetworkRequests
import AuthenticationServices

extension Backend {
    
    func performSignInWithAppleAuthorization(
        appleUserId: String,
        name: String?,
        email: String?,
        status: ASUserDetectionStatus,
        authorizationCode: Data?,
        nonceString: String?,
        identityToken: Data?,
        callback: (Result<SignInWithAppleResponse, BackendError<String>>) async -> Void
    ) async {
        let cachedData: SignInWithAppleUserDataBackup? = KeychainManager.getCustomObject(service: config!.bundleId, account: "signInWithAppleCredential")
        
        print("SIGN IN WITH APPLE EMAIL: \(String(describing: email))")
        
        if let cachedData {
            let _ = await retrySignInWithApple(
                userData: cachedData,
                nonce: nonceString,
                authCode: authorizationCode,
                identityToken: identityToken,
                callback: callback
            )
        } else {
            let _ = await signInWithApple(
                userId: appleUserId,
                name: name,
                email: email,
                status: status.rawValue,
                authCode: authorizationCode,
                nonceString: nonceString,
                identityToken: identityToken,
                callback: callback
            )
        }
    }
    
    func signInWithApple(
        userId: String,
        name: String?,
        email: String?,
        status: Int,
        authCode: Data?,
        nonceString: String?,
        identityToken: Data?,
        callback: (Result<SignInWithAppleResponse, BackendError<String>>) async -> Void
    ) async -> Result<Void, BackendError<String>>{
        let requestNonce = nonceString ?? "No nonce value"
        let requestIdentityToken = String(data: identityToken ?? JSONCoder.encode("No identity token available")!, encoding: .ascii)!
        let requestAuthCode = String(data: authCode ?? JSONCoder.encode("No authorization code available")!, encoding: .ascii)!
        
        let request: Result<SignInWithAppleResponse, NetworkError> = await Request.post(url: "\(config!.baseUrl)/\(config!.language)/api/v1/user/oauth2/apple", body: SignInWithAppleRequest(
            name: name,
            email: email,
            nonce: requestNonce,
            identityToken: requestIdentityToken,
            authCode: requestAuthCode,
            deviceToken: self.config!.deviceToken
            )
        )
        
        switch request {
        case .success(let response):
            await callback(.success(response))
            return .success(Void())
        case .failure(let error):
            let backendError = config!.getError(.SignInWithAppleFailed) ?? BackendError(type: .Custom, localizedDescription: error.localizedDescription)
            await callback(.failure(backendError))
            return .failure(backendError)
        }
        
    }
    
    func retrySignInWithApple(
        userData: SignInWithAppleUserDataBackup,
        nonce: String?,
        authCode: Data?,
        identityToken: Data?,
        callback: (Result<SignInWithAppleResponse, BackendError<String>>) async -> Void
    ) async {
        
        if let status = userData.status, let identityToken = identityToken {
            let result = await signInWithApple(
                userId: userData.userId,
                name: userData.name,
                email: userData.email,
                status: status,
                authCode: authCode,
                nonceString: nonce,
                identityToken: identityToken,
                callback: callback
            )
            
            switch result {
            case .success(_):
                KeychainManager.deleteFromKeychain(service: config!.bundleId, account: "signInWithAppleCredential")
            case .failure(let error):
                await callback(.failure(
                    config!.getError(.SignInWithAppleFailed) ?? BackendError(type: .Custom, localizedDescription: error.localizedDescription))
                )
            }
        }
        
        await callback(.failure(
            config!.getError(.SignInWithAppleFailed) ?? K.SDKError.noAPIConnectionError)
        )
        
    }
    
}
