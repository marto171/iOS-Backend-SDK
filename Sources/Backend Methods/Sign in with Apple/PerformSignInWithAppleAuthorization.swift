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
        guard let config else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let cachedData: SignInWithAppleUserDataBackup? = KeychainManager.getCustomObject(service: config.bundleId, account: "signInWithAppleCredential")
        
        print("CACHED DATA: \(String(describing: cachedData))")
        print("SIGN IN WITH APPLE EMAIL: \(String(describing: email))")
        
        if let cachedData, email == nil {
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
    
    private func signInWithApple(
        userId: String,
        name: String?,
        email: String?,
        status: Int,
        authCode: Data?,
        nonceString: String?,
        identityToken: Data?,
        callback: (Result<SignInWithAppleResponse, BackendError<String>>) async -> Void
    ) async -> Result<Void, BackendError<String>>{
        guard let config else {
            await callback(.failure(K.SDKError.noConfigError))
            return .failure(K.SDKError.noConfigError)
        }
        
        let requestNonce = nonceString ?? "No nonce value"
        let requestIdentityToken = String(data: identityToken ?? JSONCoder.encode("No identity token available")!, encoding: .ascii)!
        let requestAuthCode = String(data: authCode ?? JSONCoder.encode("No authorization code available")!, encoding: .ascii)!
        
        let body = SignInWithAppleRequest(
            name: name,
            email: email,
            nonce: requestNonce,
            identityToken: requestIdentityToken,
            authorizationCode: requestAuthCode,
            deviceToken: self.config!.deviceToken
            )
        
        let request: Result<SignInWithAppleResponse, NetworkError> = await Request.post(
            url: config.getEndpoint(for: .signInWithApple),
            body: body,
            authToken: nil,
            debugMode: config.debugMode
        )
        
        switch request {
        case .success(let response):
            if response.status == "success" {
                
                await callback(.success(response))
                return .success(Void())
            } else {
                let backendError = config.getError(.SignInWithAppleFailed) ?? BackendError(type: .Custom, localizedDescription: response.message ?? "")
                cacheData(userId: userId,
                          name: name,
                          email: email,
                          status: status
                )
                
                await callback(.failure(backendError))
                return .failure(backendError)
            }
        case .failure(let error):
            let backendError = config.getError(.SignInWithAppleFailed) ?? BackendError(type: .Custom, localizedDescription: error.localizedDescription)
            cacheData(userId: userId,
                      name: name,
                      email: email,
                      status: status
            )
            
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
    
    func cacheData(userId: String, name: String?, email: String?, status: Int?) {
        let cachedData: SignInWithAppleUserDataBackup = .init(userId: userId,
                                                              name: name,
                                                              email: email,
                                                              status: status)
        KeychainManager.saveCustomObject(service: config!.bundleId, account: "signInWithAppleCredential", object: cachedData)
    }
    
}
