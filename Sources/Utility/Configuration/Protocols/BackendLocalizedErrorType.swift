//
//  BackendLocalizedErrorType.swift
//
//
//  Created by Martin on 22.10.23.
//

import Foundation

public protocol BackendLocalizedErrorType {
    var language: String { get set }
    var localizedDescription: String { get set }
}
