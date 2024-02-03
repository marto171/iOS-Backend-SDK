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
        
        let request: Result<CreateUserDetailsResponse, NetworkError> = await Request.post(
            url: config.getEndpoint(for: .createUserDetails, parameters: ["userId": userId]),
            body: CreateUserDetailsRequest(userId: userId),
            authToken: token,
            debugMode: config.debugMode
        )
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                callback(.success(response))
            default:
                callback(.failure(config.getNormalRequestError(identifier: response.identifier, message: response.message)))
            }
        case .failure(let error):
            print("Error creating user details: \(error)")
            callback(.failure(K.SDKError.noAPIConnectionError))
        }
    }
    
}
