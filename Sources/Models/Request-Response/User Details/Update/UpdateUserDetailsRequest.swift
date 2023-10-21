//
//  UpdateUserDetailsRequest.swift
//  Wellsavor
//
//  Created by Kaloyan Petkov on 13.10.23.
//

import Foundation

struct UpdateUserDetailsRequest: Codable {
    let userId: String
    let targetCalories: Double
    let diet: String
    let allergens: [String]
    let metricSystem: String
}
