//
//  ResendConfirmEmailResponse.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 29.09.23.
//

import Foundation

public struct ResendConfirmEmailResponse: Codable {
    public let status: String
    public let message: String
    public let identifier: String?
    public let appSecurityTokenId: String?
}
