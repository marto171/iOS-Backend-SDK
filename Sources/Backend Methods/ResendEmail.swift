//
//  ResendEmail.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation

extension Backend {
    public func resendEmail(email: String, callback: (Result<ResendConfirmEmailResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let response: ResendConfirmEmailResponse? = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/email/resend", body: ResendConfirmEmailRequest(email: email))
        
        guard let response = response else {
            callback(.failure(K.SDKError.noAPIConnectionError))
            return
        }
        
        switch response.status {
        case "success":
            callback(.success(response))
        default:
            await callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message)))
        }
    }
}
