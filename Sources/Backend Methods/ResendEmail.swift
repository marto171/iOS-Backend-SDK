//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 21.10.23.
//

import Foundation

extension Backend {
    func resendEmail(email: String) async -> Result<ResendConfirmEmailResponse, BackendError> {
        if let config = config {
            let response: ResendConfirmEmailResponse? = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/email/resend", body: ResendConfirmEmailRequest(email: email))
            guard let response = response else {
                return .failure(config.getError(.APIConnectionError) ?? self.noAPIConnectionError)
            }
            
            switch response.status {
            case "success":
                return .success(response)
            default:
                return .failure(config.getError(.ConfirmEmailResendFail) ?? BackendError(type: .Custom, localizedDescription: response.message))
            }
        } else {
            return .failure(self.noConfigError)
        }
    }
}
