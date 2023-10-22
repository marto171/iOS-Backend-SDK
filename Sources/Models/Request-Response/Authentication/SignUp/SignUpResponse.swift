//
//  SignUpResponse.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 27.09.23.
//

import Foundation

public struct SignUpResponse: Codable {
    public let status: String
    public let message: String
    public let identifier: String?
}
