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
