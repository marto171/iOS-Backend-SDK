//
//  LoginResponse.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 30.09.23.
//

import Foundation

public struct LoginResponse: Codable {
    public let status: String
    public let message: String
    public let identifier: String?
    public let appSecurityTokenId: String?
}
