//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 16.01.24.
//

import Foundation

public struct SignInWithAppleUserDataBackup: Codable {
    public let userId: String
    public let name: String?
    public let email: String?
    public let status: Int?
}
