//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 21.01.24.
//

import UIKit
import NetworkRequests
import GoogleSignIn

extension Backend {
    
    public func handleSignInWithGoogle(rootVC: UIViewController, callback: (Result<SignInWithGoogleResponse, BackendError<String>>) async -> Void) async {
        guard let config else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        guard let clientID = config.googleClientID else {
            await callback(.failure(K.SDKError.noGoogleClientID))
            return
        }
        
        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootVC)
            let user = try await result.user.refreshTokensIfNeeded()
            
            guard let idToken = user.idToken?.tokenString else {
                await callback(.failure(BackendError(type: .Custom, localizedDescription: "The provided Google token was not valid!")))
                return
            }
            
            switch await sendTokenToServer(idToken) {
            case .success(let response):
                await callback(.success(response))
            case .failure(let error):
                await callback(.failure(config.getError(.SignInWithGoogleFailed) ?? BackendError(
                    type: .Custom,
                    localizedDescription: error.localizedDescription
                )))
            }
            
        } catch {
            await callback(.failure(
                config.getError(.SignInWithGoogleFailed) ?? BackendError(
                    type: .Custom,
                    localizedDescription: "Error signing in with Google: \(error.localizedDescription)"
                )))
        }
        
    }
    
    private func sendTokenToServer(_ token: String) async -> Result<SignInWithGoogleResponse, NetworkError> {
        
        let request: Result<SignInWithGoogleResponse, NetworkError>? = await Request.post(
            url: "\(config!.baseUrl)/en/api/v1/user/oauth2/google",
            body: SignInWithGoogleRequest(idToken: token),
            authToken: nil,
            debugMode: config!.debugMode
        )
        guard let request else {
            return .failure(.networkError)
        }
        
        switch request {
        case .success(let response):
            return .success(response)
        case .failure(let error):
            return .failure(error)
        }
        
    }
    
}
