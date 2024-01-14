//
//  ConfirmEmailResponse.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 29.09.23.
//

import Foundation

public struct ConfirmAuthResponse: Codable {
    public let status: String
    public let message: String?
    public let token: String?
    public let data: UserData?
    public let identifier: String?
    public let appSecurityTokenId: String?
}
