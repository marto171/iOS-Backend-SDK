//
//  ResetPasswordByCurrentPassword.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation

extension Backend {
    public func resetPasswordByCurrentPassword(password: String, newPassword: String, newPasswordConfirm: String, authToken: String, callback: (Result<ChangePasswordResponse, BackendError<String>>) -> Void) async {
        guard let config = self.config else {
            callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let response: ChangePasswordResponse? = await Request.patch(url: "\(config.baseUrl)/\(config.language)/api/v1/user/updatePassword", body: SettingsChangePasswordRequest(currentPassword: password, newPassword: newPassword, newPasswordConfirm: newPasswordConfirm), authToken: authToken)
        
        guard let response = response else {
            callback(.failure(K.SDKError.noAPIConnectionError))
            return
        }
        
        switch response.status {
        case "success":
            callback(.success(response))
        default:
            await callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message ?? K.SDKMessage.genericMessage)))
        }
    }
}
