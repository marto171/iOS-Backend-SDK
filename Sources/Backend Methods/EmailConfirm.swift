//
//  EmailConfirm.swift
//
//
//  Created by Martin on 22.10.23.
//

import Foundation

extension Backend {
    public func emailConfirm(email: String, token: String, callback: (Result<ConfirmAuthResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let response: ConfirmAuthResponse? = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/email/confirm/\(token)", body: EmailAuthRequest(email: email))
        
        guard let response = response else {
            callback(.failure(K.SDKError.noAPIConnectionError))
            return
        }
        
        switch response.status {
        case "success":
            return callback(.success(response));
        default:
            callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message ?? K.SDKMessage.genericMessage)))
        }
    }
}
