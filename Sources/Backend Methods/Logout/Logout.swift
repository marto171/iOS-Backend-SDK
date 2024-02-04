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
        
        let request: Result<BackendEmptyResponse, NetworkError> = await Request.post(
            url: self.getEndpoint(for: .logout),
            body: LogoutRequest(deviceToken: deviceToken),
            authToken: userToken,
            debugMode: config.debugMode
        )
        
        switch request {
        case .success(let response):
            if response.status == "success" {
                await callback(.success(Void()))
            } else {
                await callback(.failure(self.getResponseError(ofType: .LogoutFailed, fallbackMessage: nil)))
            }
        case .failure(let error):
            await callback(.failure(self.getResponseError(ofType: .LogoutFailed, fallbackMessage: error.localizedDescription)))
        }
    }
    
}
