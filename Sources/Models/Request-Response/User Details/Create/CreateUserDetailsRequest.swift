//
//  CreateUserDetailsRequest.swift
//  Wellsavor
//
//  Created by Kaloyan Petkov on 11.10.23.
//

import Foundation

struct CreateUserDetailsRequest: Codable {
    let userId: String
    let targetCalories: Double
    let diet: String
    let allergens: [String]
    let metricSystem: String
}
