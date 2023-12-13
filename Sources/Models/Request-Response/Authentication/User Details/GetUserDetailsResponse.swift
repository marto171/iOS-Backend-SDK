//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 13.12.23.
//

import Foundation

public struct GetUserDetailsResponse: Codable {
    public let status: String
    public let data: BackendUserDetailsData?
    public let message: String?
    public let identifier: String?
}

public struct BackendUserDetailsData: Codable {
    public let userDetails: BackendUserDetails
}

public struct BackendUserDetails: Codable {
    public let _id: String
    public let userId: String
    // other details
}

