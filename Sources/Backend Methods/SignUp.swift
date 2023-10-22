//
//  SignUp.swift
//
//
//  Created by Kaloyan Petkov on 21.10.23.
//

import Foundation

extension Backend {
    public func signUp(name: String, email: String, password: String, confirmPassword: String, callback: (Result<SignUpResponse, BackendError>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.noConfigError))
            return
        }
        
        let response: SignUpResponse? = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/signup", body: SignUpRequest(name: name, email: email, password: password, passwordConfirm: confirmPassword))
        
        guard let response = response else {
            callback(.failure(K.noAPIConnectionError))
            return
        }
        
        switch response.status {
        case "success":
            callback(.success(response))
        default:
            callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message)))
        }
    }
}
