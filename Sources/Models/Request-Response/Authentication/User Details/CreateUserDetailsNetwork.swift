//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 16.12.23.
//

import Foundation

public struct CreateUserDetailsRequest: Codable {
    let userId: String
}



public struct CreateUserDetailsResponse: Codable {
    let status: String
    let message: String?
    let identifier: String?
    let data: CreateUserDetailsData
}

public struct CreateUserDetailsData: Codable {
    let userDetails: BackendUserDetails
}
