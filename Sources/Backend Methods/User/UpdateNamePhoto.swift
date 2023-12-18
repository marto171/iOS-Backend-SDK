//
//  UpdateNamePhoto.swift
//
//
//  Created by Martin on 23.10.23.
//

import Foundation
import UIKit
import NetworkRequests

extension Backend {
    public func updateNamePhoto(name: String, image: UIImage?, authToken: String, callback: (Result<ProfileDataResponse, BackendError<String>>)  async -> Void) async {
        guard let config = self.config else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<ProfileDataResponse, NetworkError>? = await Request.patchFormData(url: "\(config.baseUrl)/\(config.language)/api/v1/user/me", json: name.data(using: .utf8)!, image: image, authToken: authToken)
        
        guard let request else {
            await callback(.failure(K.SDKError.noAPIConnectionError))
            return
        }
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                return await callback(.success(response));
            default:
                await callback(.failure(
                    config.getError(.CannotSaveUserDetails)
                    ??
                    BackendError(type: .CannotSaveUserDetails, localizedDescription: "User details could not be saved. Please try again!")
                ))
            }
        case .failure(let error):
            print("Form data error: \(error.rawValue)")
            await callback(.failure(
                config.getError(.CannotSaveUserDetails)
                ??
                BackendError(type: .CannotSaveUserDetails, localizedDescription: "User details could not be saved. Please try again!")
            ))
        }
        
    }
}
