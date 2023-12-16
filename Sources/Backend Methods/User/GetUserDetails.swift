//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 13.12.23.
//

import Foundation
import NetworkRequests

extension Backend {
    
    public func getUserDetails(userId: String, callback: (Result<GetUserDetailsResponse, BackendError<String>>) async -> Void) async {
        
        guard let config = self.config else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<GetUserDetailsResponse, NetworkError> = await Request.get(url: "\(config.baseUrl)/\(config.language)/api/v1/user/\(userId)/details")
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                await callback(.success(response))
            default:
                await callback(.failure(config.getNormalRequestError(identifier: response.identifier, message: response.message)))
            }
        case .failure(_):
            await callback(.failure(K.SDKError.noAPIConnectionError))
        }
    }
    
}
