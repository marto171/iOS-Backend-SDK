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
        
        let request: Result<GetUserDataResponse, NetworkError> = await Request.get(
            url: self.getEndpoint(for: .getUser),
            authToken: authToken,
            debugMode: config.debugMode
        )
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                return callback(.success(response));
            default:
                callback(.failure(self.getResponseError(ofType: .UserNotFound, fallbackMessage: response.message)))
            }
        case .failure(let error):
            callback(.failure(self.getResponseError(ofType: .UserNotFound, fallbackMessage: error.localizedDescription)))
        }
    }
}
