//
//  Login.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation
import NetworkRequests

extension Backend {
    public func login(email: String, password: String, callback: (Result<LoginResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<LoginResponse, NetworkError> = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/login", body: LoginRequest(email: email, password: password))
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                callback(.success(response))
            default:
                if response.identifier == "EmailNotVerified" {
                    await resendEmail(email: email) { result in
                        switch result {
                        case .success(let response):
                            callback(.failure(BackendError(type: .Custom, localizedDescription: response.message)))
                        case .failure(let error):
                            callback(.failure(error))
                        }
                    }
                } else {
                    callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message)))
                }
            }
        case .failure(_):
            callback(.failure(K.SDKError.noAPIConnectionError))
        }
        
        
    }
}
