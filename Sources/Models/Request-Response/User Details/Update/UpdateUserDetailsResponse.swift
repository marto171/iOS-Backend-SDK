//
//  UpdateUserDetailsResponse.swift
//  Wellsavor
//
//  Created by Kaloyan Petkov on 13.10.23.
//

import Foundation

struct UpdateUserDetailsResponse: Codable {
    let status: String
    let message: String?
    let identifier: String?
    let data: UserDetails?
}
