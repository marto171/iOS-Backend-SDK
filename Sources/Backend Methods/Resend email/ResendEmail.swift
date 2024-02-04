//
//  ResendEmail.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation
import NetworkRequests

extension Backend {
    public func resendEmail(email: String, callback: (Result<ResendConfirmEmailResponse, BackendError<String>>) async -> Void) async {
        guard let config = self.config else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<ResendConfirmEmailResponse, NetworkError> = await Request.post(
            url: self.getEndpoint(for: .resendConfirmEmail),
            body: ResendConfirmEmailRequest(email: email),
            authToken: nil,
            debugMode: config.debugMode
        )
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                await callback(.success(response))
            default:
                await callback(.failure(self.getResponseError(ofType: .ConfirmEmailResendFailed, fallbackMessage: response.message)))
            }
        case .failure(let error):
            await callback(.failure(self.getResponseError(ofType: .ConfirmEmailResendFailed, fallbackMessage: error.localizedDescription)))
        }
    }
}
