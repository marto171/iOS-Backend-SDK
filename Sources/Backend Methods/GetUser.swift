//
//  GetUser.swift
//
//
//  Created by Martin on 23.10.23.
//

import Foundation

extension Backend {
    public func getUser(authToken: String, callback: (Result<GetUserDataResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let response: GetUserDataResponse? = await Request.get(url: "\(config.baseUrl)/\(config.language)/api/v1/user/me", authToken: authToken)
        
        guard let response = response else {
            callback(.failure(K.SDKError.noAPIConnectionError))
            return
        }
        
        switch response.status {
        case "success":
            return callback(.success(response));
        default:
            await callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message ?? K.SDKMessage.genericMessage)))
        }
    }
}
