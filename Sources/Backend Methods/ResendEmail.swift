//
//  ResendEmail.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation

extension Backend {
    public func resendEmail(email: String) async -> Result<ResendConfirmEmailResponse, BackendError<String>> {
        guard let config = self.config else {
            return .failure(K.SDKError.noConfigError)
        }
        
        let response: ResendConfirmEmailResponse? = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/email/resend", body: ResendConfirmEmailRequest(email: email))
        
        guard let response = response else {
            return .failure(K.SDKError.noAPIConnectionError)
        }
        
        switch response.status {
        case "success":
            return .success(response)
        default:
            return .failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message))
        }
    }
}
