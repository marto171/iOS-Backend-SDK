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
    public func updateNamePhoto(name: String, image: UIImage?, authToken: String, callback: (Result<ProfileDataResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<ProfileDataResponse, NetworkError>? = await Request.patchFormData(url: "\(config.baseUrl)/\(config.language)/api/v1/user/me", json: name.data(using: .utf8)!, images: [image], authToken: authToken)
        
        guard let request else {
            callback(.failure(K.SDKError.noAPIConnectionError))
            return
        }
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                return callback(.success(response));
            default:
                callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message ?? K.SDKMessage.genericMessage)))
            }
        case .failure(let error):
            print("Form data error: \(error)")
            callback(.failure(K.SDKError.noAPIConnectionError))
        }
        
    }
}
