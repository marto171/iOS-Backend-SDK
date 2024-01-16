//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 16.01.24.
//

import Foundation

public struct SignInWithAppleResponse: Codable {
    let status: String
    let message: String?
    let identifier: String?
    let token: String?
    let data: UserData?
}
