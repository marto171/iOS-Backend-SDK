//
//  SettingsChangePasswordBody.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 6.10.23.
//

import SwiftUI

public struct SettingsChangePasswordRequest: Codable {
    public let currentPassword: String
    public let newPassword: String
    public let newPasswordConfirm: String
}
