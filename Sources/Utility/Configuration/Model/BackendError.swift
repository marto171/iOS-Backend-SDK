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
