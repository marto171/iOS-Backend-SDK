//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 16.01.24.
//

import Foundation

public struct SignInWithAppleResponse: Codable {
    public let status: String
    public let message: String?
    public let identifier: String?
    public let token: String?
    public let data: UserData?
}
