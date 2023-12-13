//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 13.12.23.
//

import Foundation
import NetworkRequests

extension Backend {
    
    public func getUserDetails(userId: String, callback: @escaping (Result<GetUserDataResponse, BackendError<String>>) -> Void) async {
        
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<GetUserDataResponse, NetworkError> = await Request.get(url: "\(config.baseUrl)/\(config.language)/api/v1/user/\(userId)/details")
        
        switch request {
        case .success(let response):
            callback(.success(response))
        case .failure(_):
            callback(.failure(K.SDKError.noAPIConnectionError))
        }
    }
    
}
