//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 21.10.23.
//

import Foundation
import GoogleSignIn

public struct BackendConfig: Config {
    public var bundleId: String
    public var deviceToken: String
    public var baseUrl: String
    public var language: String
    public var errors: [BackendError<[BackendLocalizedErrorType]>]
    
    // Optional
    private var _googleClientID: String? = nil
    public var googleClientID: String? {
        get {
            return _googleClientID
        }
        set {
            if let newValue {
                GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: newValue)
            }
            _googleClientID = newValue
        }
    }
    
    @MainActor public func getError(_ type: BackendErrorType?) -> BackendError<String>? {
        guard let type, let config = Backend.shared.config else {
            return nil
        }
        
        if !errors.isEmpty {
            let errorsNotLocalized = errors.first(where: { $0.type == type })?.localizedDescription
            
            if let errorsNotLocalized {
                let error = errorsNotLocalized.first(where: { $0.language == config.language })
                
                if let error = error {
                    return BackendError(type: type, localizedDescription: error.localizedDescription)
                }
            }
        }
        return nil
    }
    
    @MainActor public func getNormalRequestError(identifier: String?, message: String?) -> BackendError<String> {
        return getError(BackendErrorType(rawValue: identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: message ?? K.SDKMessage.genericMessage)
    }
    
    public init(bundleId: String, deviceToken: String, baseUrl: String, language: String, googleClientID: String? = nil, errors: [BackendError<[BackendLocalizedErrorType]>]) {
        self.bundleId = bundleId
        self.deviceToken = deviceToken
        self.baseUrl = baseUrl
        self.language = language
        self.errors = errors
        
        if let googleClientID {
            self._googleClientID = googleClientID
            GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: self._googleClientID!)
        }
    }
}
