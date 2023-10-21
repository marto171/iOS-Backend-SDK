//
//  ExampleErrors.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation

public struct ExampleError: CustomError {
    public var type: CustomTypeError
    public var message: String
}
