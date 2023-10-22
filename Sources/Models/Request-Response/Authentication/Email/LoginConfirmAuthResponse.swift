//
//  ConfirmEmailResponse.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 29.09.23.
//

import Foundation

public struct LoginConfirmAuthResponse: Codable {
    public let status: String
    public let message: String?
    public let token: String?
    public let user: User?
    public let identifier: String?
}
