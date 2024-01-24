//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 24.01.24.
//

import Foundation

public struct DeleteAccountResponse: Codable {
    public let status: String
    public let message: String?
    public let identifier: String?
}
