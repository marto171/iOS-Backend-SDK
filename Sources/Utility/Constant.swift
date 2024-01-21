//
//  Constant.swift
//  
//
//  Created by Martin on 22.10.23.
//

import Foundation

public struct K {
    struct SDKMessage {
        static let genericMessage = "Uh-oh! Something went wrong. Please try again later!"
    }
    
    struct SDKError {
        static let noConfigError = BackendError(type: .Custom, localizedDescription: "No config object provided.")
        static let noAPIConnectionError = BackendError(type: .Custom, localizedDescription: "Error connecting to API!")
        static let noGoogleClientID = BackendError(type: .Custom, localizedDescription: "Google ClientID is not provided!")
    }
}
