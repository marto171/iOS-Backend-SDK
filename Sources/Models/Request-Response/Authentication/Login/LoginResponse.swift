//
//  LoginResponse.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 30.09.23.
//

import Foundation

struct LoginResponse: Codable {
    let status: String
    let message: String
    let identifier: String?
}
