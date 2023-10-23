//
//  GetUserDataResponse.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 4.10.23.
//

import Foundation

public struct GetUserDataResponse: Codable {
    public let status: String
    public let message: String?
    public let identifier: String?
    public let data: User?
}
