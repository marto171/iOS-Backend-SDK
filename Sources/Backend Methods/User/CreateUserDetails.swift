//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 16.12.23.
//

import Foundation
import NetworkRequests

extension Backend {
    
    public func createUserDetails(userId: String, token: String, callback: (Result<CreateUserDetailsResponse, BackendError<String>>) -> Void) async { // add other parameters when user details has more variables
        
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<CreateUserDetailsResponse, NetworkError>? = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v1/user/\(userId)/details", body: CreateUserDetailsRequest(userId: userId), authToken: token)
        
        guard let request else {
            callback(.failure(K.SDKError.noAPIConnectionError))
            return
        }
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                callback(.success(response))
            default:
                callback(.failure(config.getNormalRequestError(identifier: response.identifier, message: response.message)))
            }
        case .failure(_):
            callback(.failure(K.SDKError.noAPIConnectionError))
        }
    }
    
}
