//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 24.01.24.
//

import Foundation
import NetworkRequests

extension Backend {
    
    public func logOut(userToken: String, deviceToken: String, callback: (Result<Void, BackendError<String>>) async -> Void) async {
        guard let config else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<BackendEmptyResponse, NetworkError>? = await Request.post(
            url: "\(config.baseUrl)/en/api/v1/user/logout",
            body: LogoutRequest(deviceToken: deviceToken),
            authToken: userToken
        )
        guard let request else {
            await callback(.failure(config.getError(.LogoutFailed) ?? K.SDKError.noAPIConnectionError))
            return
        }
        
        if case .success(let response) = request {
            if response.status == "success" { 
                await callback(.success(Void()))
            } else {
                await callback(.failure(config.getError(.LogoutFailed) ?? K.SDKError.noAPIConnectionError))
            }
        }
    }
    
}
