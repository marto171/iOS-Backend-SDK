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
        
        let request: Result<LoginResponse, NetworkError> = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/login", body: LoginRequest(email: email, password: password))
        
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
                            await callback(.failure(error))
                        }
                    }
                } else {
                    await callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message)))
                }
            }
        case .failure(_):
            await callback(.failure(K.SDKError.noAPIConnectionError))
        }
        
        
    }
}
