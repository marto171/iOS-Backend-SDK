//
//  LocalizedErrors.swift
//  
//
//  Created by Martin on 21.10.23.
//

import Foundation

public protocol LocalizedErrors {
    var bg: [CustomError] { get }
    var en: [CustomError] { get }
    var de: [CustomError] { get }
}
