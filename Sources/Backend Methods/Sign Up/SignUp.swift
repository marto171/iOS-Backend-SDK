//
//  Signup.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation
import NetworkRequests

extension Backend {
    public func signUp(name: String, email: String, password: String, confirmPassword: String, callback: (Result<SignUpResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<SignUpResponse, NetworkError> = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/signup/basic", body: SignUpRequest(name: name, email: email, password: password, passwordConfirm: confirmPassword))
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                callback(.success(response))
            default:
                callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message)))
            }
        case .failure(_):
            callback(.failure(K.SDKError.noAPIConnectionError))
        }
        
        
    }
}
