//
//  ConfirmEmailRequest.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 29.09.23.
//

import Foundation

struct EmailAuthRequest: Codable {
    let email: String
    var deviceToken: String? = nil
    var appSecurityTokenId: String? = ""
}
