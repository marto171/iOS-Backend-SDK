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
    public var errors: [BackendError]
    
    public func getError(_ type: BackendErrorType) -> BackendError? {
        if !errors.isEmpty {
            let index = errors.firstIndex(where: { $0.type == type })
            if let index = index {
                return errors[index]
            }
        }
        return nil
    }
    
    public init(baseUrl: String, language: String, errors: [BackendError]) {
        self.baseUrl = baseUrl
        self.language = language
        self.errors = errors
    }
}
