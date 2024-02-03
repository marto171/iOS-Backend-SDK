//
//  LocalizedError.swift
//
//
//  Created by Martin on 22.10.23.
//

import Foundation

public struct LocalizedError: BackendLocalizedErrorType {
    public var language: String
    public var localizedDescription: String
    
    public init(language: String, localizedDescription: String) {
        self.language = language
        self.localizedDescription = localizedDescription
    }
}
