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
    public var errors: [BackendError<Any>]
    
    public func getError(_ type: BackendErrorType?) -> BackendError<String>? {
        guard let type = type else {
            return nil
        }
        
        if !errors.isEmpty {
            #warning("Fix this, so it returns the error from the configuration or in case there is no such error, then return nil.")
            #warning("Make this logic, so it can search for all of the backend errors in different languages and just find this one which is on the right one.")
            
            let index = errors.firstIndex(where: { $0.type == type })
            if let index = index {
                return BackendError(type: .Custom, localizedDescription: "123")
            }
        }
        return nil
    }
    
    public init(baseUrl: String, language: String, errors: [BackendError<Any>]) {
        self.baseUrl = baseUrl
        self.language = language
        self.errors = errors
    }
}
