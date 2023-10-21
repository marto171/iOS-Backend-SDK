//
//  CustomError.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation

public protocol CustomError {
    var type: CustomTypeError { get }
    var message: String { get }
}
