//
//  BackendError.swift
//  
//
//  Created by Kaloyan Petkov on 21.10.23.
//

import Foundation

public struct BackendError<T>: BackendCustomError {
    public var type: BackendErrorType
    public var localizedDescription: T

    public init(type: BackendErrorType, localizedDescription: T) {
        self.type = type
        self.localizedDescription = localizedDescription
    }
}

public protocol BackendLocalizedErrorType {
    var language: String { get set }
    var localizedDescription: String { get set }
}

public struct BackendLocalizedError: BackendLocalizedErrorType {
    public var language: String
    public var localizedDescription: String
    
    public init(language: String, localizedDescription: String) {
        self.language = language
        self.localizedDescription = localizedDescription
    }
}
