//
//  RequestResetPassword.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation
import NetworkRequests

extension Backend {
    public func requestResetPassword(email: String, callback: (Result<ConfirmAuthResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<ConfirmAuthResponse, NetworkError> = await Request.post(
            url: self.getEndpoint(for: .requestResetPassword),
            body: EmailAuthRequest(email: email),
            authToken: nil,
            debugMode: config.debugMode
        )
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                callback(.success(response))
            default:
                callback(.failure(self.getResponseError(ofType: .RequestResendPasswordFailed, fallbackMessage: response.message)))
            }
        case .failure(let error):
            callback(.failure(self.getResponseError(ofType: .RequestResendPasswordFailed, fallbackMessage: error.localizedDescription)))
        }
        
        
    }
}
