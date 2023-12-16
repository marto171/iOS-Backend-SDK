//
//  ResetPassword.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation
import NetworkRequests

extension Backend {
    public func resetPassword(token: String, email: String, password: String, confirmPassword: String, callback: (Result<ConfirmAuthResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<ConfirmAuthResponse, NetworkError> = await Request.patch(url: "\(config.baseUrl)/\(config.language)/api/v1/user/password/reset/\(token)", body: ResetPasswordRequest(email: email, password: password, passwordConfirm: confirmPassword))
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                callback(.success(response))
            default:
                callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message ?? K.SDKMessage.genericMessage)))
            }
        case .failure(_):
            callback(.failure(K.SDKError.noAPIConnectionError))
        }
        
    }
}
