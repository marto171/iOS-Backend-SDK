//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 21.10.23.
//

import Foundation

public struct BackendError: BackendCustomError {
    public var type: BackendErrorType
    public var localizedDescription: String
    
    public init(type: BackendErrorType, localizedDescription: String, localizedDescriptionBG: String? = nil, localizedDescriptionDE: String? = nil) {
        self.type = type
        self.localizedDescription = localizedDescription
    }
}
