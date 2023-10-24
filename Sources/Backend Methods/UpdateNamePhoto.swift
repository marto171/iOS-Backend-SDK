//
//  UpdateNamePhoto.swift
//
//
//  Created by Martin on 23.10.23.
//

import Foundation
import UIKit

extension Backend {
    public func updateNamePhoto(name: String, image: UIImage?, authToken: String, callback: (Result<ProfileDataResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let response: ProfileDataResponse? = await FormRequest.patchFormData(url: "\(config.baseUrl)/\(config.language)/api/v1/user/me", json: name.data(using: .utf8)!, image: image, authToken: authToken)
        
        guard let response = response else {
            callback(.failure(K.SDKError.noAPIConnectionError))
            return
        }
        
        switch response.status {
        case "success":
            return callback(.success(response));
        default:
            await callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message ?? K.SDKMessage.genericMessage)))
        }
    }
}
