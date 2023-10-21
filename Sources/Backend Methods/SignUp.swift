//
//  SignUp.swift
//
//
//  Created by Kaloyan Petkov on 21.10.23.
//

import Foundation

extension Backend {
    public func signUp(name: String, email: String, password: String, confirmPassword: String, callback: (Result<SignUpResponse, BackendError>) -> Void) async {
        if let config = config {
            let response: SignUpResponse? = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/signup", body: SignUpRequest(name: name, email: email, password: password, passwordConfirm: confirmPassword))
            guard let response = response else {
                callback(.failure(config.getError(.APIConnectionError) ?? self.noAPIConnectionError))
                return
            }
            
            switch response.status {
            case "success":
                callback(.success(response))
            default:
                callback(.failure(config.getError(.SignUpFail) ?? BackendError(type: .Custom, localizedDescription: response.message)))
            }
            
        } else {
            callback(.failure(self.noConfigError))
        }
    }
}
