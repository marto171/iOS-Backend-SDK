//
//  EmailConfirm.swift
//
//
//  Created by Martin on 22.10.23.
//

import Foundation
import NetworkRequests

extension Backend {
    public func emailConfirm(email: String, token: String, deviceToken: String? = nil, appSecurityTokenId: String? = nil, callback: (Result<ConfirmAuthResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<ConfirmAuthResponse, NetworkError> = await Request.post(
            url: self.getEndpoint(for: .emailConfirm, parameters: ["token": token]),
            body: EmailAuthRequest(email: email, deviceToken: deviceToken, appSecurityTokenId: appSecurityTokenId),
            authToken: nil,
            debugMode: config.debugMode
        )
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                return callback(.success(response));
            default:
                callback(.failure(self.getResponseError(ofType: .EmailConfirmFailed, fallbackMessage: response.message)))
            }
        case .failure(let error):
            callback(.failure(self.getResponseError(ofType: .EmailConfirmFailed, fallbackMessage: error.localizedDescription)))
        }
        
        
    }
}
