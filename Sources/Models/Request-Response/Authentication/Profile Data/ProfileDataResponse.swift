//
//  ProfileDataResponse.swift
//
//
//  Created by Martin on 23.10.23.
//

import Foundation

public struct ProfileDataResponse: Codable {
    public let status: String
    public let message: String?
    public let data: UserData?
    public let identifier: String?
}
