//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 21.10.23.
//

import Foundation

public struct BackendConfig: Config {
    public var baseUrl: String
    public var language: String
    public var errors: [BackendError<[BackendLocalizedErrorType]>]
    
    @MainActor public func getError(_ type: BackendErrorType?) -> BackendError<String>? {
        guard let type = type, let config = Backend.shared.config else {
            return nil
        }
        
        if !errors.isEmpty {
            let errorsNotLocalized = errors.first(where: { $0.type == type })?.localizedDescription
            
            if let errorsNotLocalized = errorsNotLocalized {
                let error = errorsNotLocalized.first(where: { $0.language == config.language })
                
                if let error = error {
                    return BackendError(type: type, localizedDescription: error.localizedDescription)
                }
            }
        }
        return nil
    }
    
    public init(baseUrl: String, language: String, errors: [BackendError<[BackendLocalizedErrorType]>]) {
        self.baseUrl = baseUrl
        self.language = language
        self.errors = errors
    }
}
