//
//  SignUpRequest.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 27.09.23.
//

import Foundation

struct SignUpRequest: Codable {
    let name: String
    let email: String
    let password: String
    let passwordConfirm: String
    let deviceToken: String?
}
