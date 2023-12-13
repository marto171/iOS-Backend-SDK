//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 13.12.23.
//

import Foundation

struct GetUserDetailsResponse: Codable {
    let status: String
    let data: BackendUserDetailsData?
    let message: String?
    let identifier: String?
}

struct BackendUserDetailsData: Codable {
    let userDetails: BackendUserDetails
}

struct BackendUserDetails: Codable {
    let _id: String
    let userId: String
    // other details
}

