//
//  CreateUserDetailsResponse.swift
//  Wellsavor
//
//  Created by Kaloyan Petkov on 11.10.23.
//

import Foundation

struct CreateUserDetailsResponse: Codable {
    let status: String
    let message: String?
    let identifier: String?
    let data: UserDetails?
}
