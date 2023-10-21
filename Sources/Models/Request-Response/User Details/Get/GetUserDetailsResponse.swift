//
//  GetUserDetailsResponse.swift
//  Wellsavor
//
//  Created by Kaloyan Petkov on 12.10.23.
//

import Foundation

struct GetUserDetailsResponse: Codable {
    let status: String
    let message: String?
    let identifier: String?
    let data: UserDetails?
}
