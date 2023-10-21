//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 21.10.23.
//

import Foundation

public struct BackendError: BackendCustomError {
    
    #error("Change language scheme because it's already in the config")
    public var type: BackendErrorType
    public var localizedDescription: String
    public var localizedDescriptionBG: String?
    public var localizedDescriptionDE: String?
    
    
    
    public init(type: BackendErrorType, localizedDescription: String, localizedDescriptionBG: String? = nil, localizedDescriptionDE: String? = nil) {
        self.type = type
        self.localizedDescription = localizedDescription
        self.localizedDescriptionBG = localizedDescriptionBG
        self.localizedDescriptionDE = localizedDescriptionDE
    }
}
