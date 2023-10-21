//
//  Config.swift
//
//
//  Created by Martin on 20.10.23.
//

import Foundation

public protocol Config {
    var baseUrl: String { get set }
    var language: String { get set }
    var errors: [BackendError] { get set }
}
