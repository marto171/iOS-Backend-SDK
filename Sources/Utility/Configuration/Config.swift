//
//  Config.swift
//
//
//  Created by Martin on 20.10.23.
//

import Foundation

public protocol Config {
    var baseUrl: String { get }
    var language: CustomLanguage { get }
    var errors: LocalizedErrors { get }
}
