//
//  CustomError.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation

public protocol BackendCustomError: Error {
    var type: BackendErrorType { get set }
}
