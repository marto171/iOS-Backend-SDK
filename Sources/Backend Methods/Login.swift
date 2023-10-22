//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 21.10.23.
//

import Foundation

extension Backend {
    public func login(email: String, password: String, callback: (Result<LoginResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.noConfigError))
            return
        }
        
        let response: LoginResponse? = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/login", body: LoginRequest(email: email, password: password))
        
        guard let response = response else {
            callback(.failure(K.noAPIConnectionError))
            return
        }
        
        switch response.status {
        case "success":
            callback(.success(response))
        default:
            if response.identifier == "EmailNotVerified" {
                let resendResponse = await resendEmail(email: email)
                
                switch resendResponse {
                case .success(let resendConfirmEmailResponse):
                    callback(.failure(BackendError(type: .Custom, localizedDescription: resendConfirmEmailResponse.message)))
                case .failure(let error):
                    callback(.failure(error))
                }
            } else {
                callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message)))
            }
        }
    }
}
