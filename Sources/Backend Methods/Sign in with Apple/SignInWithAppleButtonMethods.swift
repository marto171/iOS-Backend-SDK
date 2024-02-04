//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 16.01.24.
//

import SwiftUI
import AuthenticationServices
import Toolchain

extension Backend {
    
    
    public func completeSignInWithApple(result: Result<ASAuthorization, Error>, nonce: Nonce, callback: (Result<SignInWithAppleResponse, BackendError<String>>) async -> Void) async {
        guard self.config != nil else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        switch result {
        case .success(let authResults):
            switch authResults.credential {
            case let credential as ASAuthorizationAppleIDCredential:
                var name: String?
                if let firstName = credential.fullName?.givenName, let lastName = credential.fullName?.familyName {
                    name = "\(firstName) \(lastName)"
                }
                
                await performSignInWithAppleAuthorization(
                    appleUserId: credential.user,
                    name: name,
                    email: credential.email,
                    status: credential.realUserStatus,
                    authorizationCode: credential.authorizationCode,
                    nonceString: nonce.description,
                    identityToken: credential.identityToken) { result in
                        switch result {
                        case .success(let response):
                            await callback(.success(response))
                        case .failure(let error):
                            
                            await callback(.failure(self.getResponseError(ofType: .SignInWithAppleFailed, fallbackMessage: error.localizedDescription)))
                        }
                    }
            default:
                await callback(.failure(self.getResponseError(ofType: .SignInWithAppleFailed, fallbackMessage: nil)))
            }
        case .failure(let error):
            await callback(.failure(self.getResponseError(ofType: .SignInWithAppleFailed, fallbackMessage: error.localizedDescription)))
        }
    }
    
    
}
