//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 24.01.24.
//

import Foundation
import NetworkRequests
import GoogleSignIn

extension Backend {
    
    public func deleteUser(_ user: BackendUser, callback: (Result<DeleteAccountResponse, BackendError<String>>) async -> Void) async {
        guard let config else {
            await callback(.failure(K.SDKError.noConfigError))
            return
        }
        
        if user.oauthProvider == "google" {
            do {
                try await self.disconnectUserFromGoogle()
            } catch {
                await callback(.failure(BackendError(type: .Custom, localizedDescription: error.localizedDescription)))
                return
            }
        }
        
        let request: Result<DeleteAccountResponse, NetworkError>? = await Request.delete(
            url: config.getEndpoint(for: .deleteUser),
            authToken: user.token ?? "",
            debugMode: config.debugMode
        )
        guard let request else {
            await callback(.failure(config.getError(.AccountDeletionFailed) ?? K.SDKError.noAPIConnectionError))
            return
        }
        
        switch request {
        case .success(let response):
            if response.status == "success" {
                await callback(.success(response))
            } else {
                await callback(.failure(BackendError(
                        type: .Custom,
                        localizedDescription: response.message ?? K.SDKError.noAPIConnectionError.localizedDescription)
                    )
                )
            }
        case .failure(let error):
            await callback(.failure(BackendError(type: .Custom, localizedDescription: error.localizedDescription)))
        }
    }
    
    func disconnectUserFromGoogle() async throws {
        do {
            try await GIDSignIn.sharedInstance.disconnect()
        } catch {
            throw error
        }
    }
}
