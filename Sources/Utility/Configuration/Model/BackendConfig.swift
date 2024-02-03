//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 21.10.23.
//

import Foundation
import GoogleSignIn

public struct BackendConfig {
    public var debugMode: Bool
    public var bundleId: String
    public var deviceToken: String
    public var language: String
    public var backendUrls: BackendUrls
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
    
    // Endpoints
    public func getEndpoint(for endpointType: BackendEndpointType, parameters: [String: String]? = nil) -> String {
        var endpoint = self.backendUrls.endpoints.first(where: { $0.types.contains(endpointType) })!
        endpoint.parameters = parameters
        return "\(self.backendUrls.baseUrl)\(self.backendUrls.constantPrefix ?? "")\(endpoint.string)"
    }
    
    
    //Errors
    @MainActor
    public func getError(_ type: BackendErrorType?) -> BackendError<String>? {
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
    
    @MainActor 
    public func getNormalRequestError(identifier: String?, message: String?) -> BackendError<String> {
        return getError(BackendErrorType(rawValue: identifier ?? "")) ?? BackendError(type: .Custom, localizedDescription: message ?? K.SDKMessage.genericMessage)
    }
    
    public init(
        debugMode: Bool = false,
        bundleId: String,
        deviceToken: String,
        language: String,
        googleClientID: String? = nil,
        backendUrls: BackendUrls,
        errors: [BackendError<[BackendLocalizedErrorType]>]
    ) {
        self.debugMode = debugMode
        self.bundleId = bundleId
        self.deviceToken = deviceToken
        self.language = language
        self.backendUrls = backendUrls
        self.errors = errors
        
        if let googleClientID {
            self._googleClientID = googleClientID
            GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: self._googleClientID!)
        }
    }
}
