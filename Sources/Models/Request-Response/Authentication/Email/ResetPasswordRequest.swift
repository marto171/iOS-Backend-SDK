//
//  ResetPasswordRequest.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 1.10.23.
//

import SwiftUI

struct ResetPasswordRequest: Codable {
    let email: String
    let password: String
    let passwordConfirm: String
    var deviceToken: String? = nil
    var appSecurityTokenId: String? = nil
}
