//
//  ChangePasswordResponse.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 6.10.23.
//

import SwiftUI

public struct ChangePasswordResponse: Codable {
    public let status: String
    public let token: String?
    public let message: String?
    public let identifier: String?
    public let data: UserData?
}
