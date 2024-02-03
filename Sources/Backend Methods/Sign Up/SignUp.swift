//
//  Signup.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation
import NetworkRequests

extension Backend {
    public func signUp(name: String, email: String, password: String, confirmPassword: String, deviceToken: String? = "", callback: (Result<SignUpResponse, BackendError<String>>) async -> Void) async {
        guard let config = self.config else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        let request: Result<SignUpResponse, NetworkError> = await Request.post(
            url: config.getEndpoint(for: .signup),
            body: SignUpRequest(
                name: name,
                email: email,
                password: password,
                passwordConfirm: confirmPassword,
                deviceToken: deviceToken
            ),
            authToken: nil,
            debugMode: config.debugMode
        )
        
        switch request {
        case .success(let response):
            switch response.status {
            case "success":
                await callback(.success(response))
            default:
                await callback(.failure(config.getError(BackendErrorType(rawValue: response.identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: response.message)))
            }
        case .failure(_):
            await callback(.failure(K.SDKError.noAPIConnectionError))
        }
        
        
    }
}
