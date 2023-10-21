//
//  Backend.swift
//
//
//  Created by Martin on 20.10.23.
//

import Foundation

@MainActor public struct Backend {
    public static var shared: Backend = Backend()
    
    let noConfigError = BackendError(type: .Custom, localizedDescription: "No config object provided")
    let noAPIConnectionError = BackendError(type: .Custom, localizedDescription: "Error connecting to API!")
    public var config: BackendConfig?
    
    private init() {}
    
}
