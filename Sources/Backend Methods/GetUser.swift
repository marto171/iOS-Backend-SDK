//
//  GetUser.swift
//
//
//  Created by Martin on 23.10.23.
//

import Foundation
import NetworkRequests

extension Backend {
    public func getUser(authToken: String, callback: (Result<GetUserDataResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<GetUserDataResponse, NetworkError> = await Request.get(url: "\(config.baseUrl)/\(config.language)/api/v1/user/me", authToken: authToken)
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                return callback(.success(response));
            default:
                callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message ?? K.SDKMessage.genericMessage)))
            }
        case .failure(let error):
            callback(.failure(K.SDKError.noAPIConnectionError))
        }
    }
}
