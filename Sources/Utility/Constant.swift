//
//  Constant.swift
//  
//
//  Created by Martin on 22.10.23.
//

import Foundation

public struct K {
    static let noConfigError = BackendError(type: .Custom, localizedDescription: "No config object provided.")
    static let noAPIConnectionError = BackendError(type: .Custom, localizedDescription: "Error connecting to API!")
}
