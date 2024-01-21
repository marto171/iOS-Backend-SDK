//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 21.01.24.
//

import Foundation

struct SignInWithGoogleResponse: Codable {
    let status: String
    public let message: String?
    public let identifier: String?
    public let token: String?
    public let data: UserData?
}
