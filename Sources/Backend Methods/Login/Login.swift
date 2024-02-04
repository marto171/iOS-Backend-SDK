//
//  Login.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation
import NetworkRequests

extension Backend {
    public func login(email: String, password: String, callback: (Result<LoginResponse, BackendError<String>>) async -> Void) async {
        guard let config = self.config else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<LoginResponse, NetworkError> = await Request.post(
            url: self.getEndpoint(for: .login),
            body: LoginRequest(email: email, password: password),
            authToken: nil,
            debugMode: config.debugMode
        )
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                await callback(.success(response))
            default:
                if response.identifier == "EmailNotVerified" {
                    await resendEmail(email: email) { result in
                        switch result {
                        case .success(let response):
                            await callback(.success(
                                .init(status: response.status,
                                      message: response.message,
                                      identifier: response.identifier,
                                      appSecurityTokenId: response.appSecurityTokenId
                                     )
                            ))
                        case .failure(let error):
                            await callback(.failure(self.getResponseError(ofType: .LoginFailed, fallbackMessage: error.localizedDescription)))
                        }
                    }
                } else {
                    await callback(.failure(self.getResponseError(ofType: .LoginFailed, fallbackMessage: response.message)))
                }
            }
        case .failure(let error):
            await callback(.failure(self.getResponseError(ofType: .LoginFailed, fallbackMessage: error.localizedDescription)))
        }
        
        
    }
}
