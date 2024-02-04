//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 13.12.23.
//

import Foundation
import NetworkRequests

extension Backend {
    
    public func getUserDetails(userId: String, authToken: String, callback: (Result<GetUserDetailsResponse, BackendError<String>>) async -> Void) async {
        
        guard let config = self.config else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<GetUserDetailsResponse, NetworkError> = await Request.get(
            url: self.getEndpoint(for: .getUserDetails, parameters: ["userId": userId]),
            authToken: authToken,
            debugMode: config.debugMode
        )
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                await callback(.success(response))
            default:
                await callback(.failure(self.getResponseError(ofType: .NoUserDetails, fallbackMessage: response.message)))
            }
        case .failure(let error):
            await callback(.failure(self.getResponseError(ofType: .UserNotFound, fallbackMessage: error.localizedDescription)))
        }
    }
    
}
