//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 16.01.24.
//

import Foundation

struct SignInWithAppleRequest: Codable {
    let name: String?
    let email: String?
    let nonce: String
    let identityToken: String
    let authCode: String
    let deviceToken: String?
}
