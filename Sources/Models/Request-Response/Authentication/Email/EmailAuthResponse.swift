//
//  ConfirmEmailResponse.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 29.09.23.
//

import Foundation

struct EmailAuthResponse: Codable {
    let status: String
    let message: String?
    let token: String?
    let data: User?
}
