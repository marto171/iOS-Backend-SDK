//
//  UserDetails.swift
//  
//
//  Created by Martin on 21.10.23.
//

import Foundation

struct UserDetails: Codable {
    let userId: String
    let targetCalories: Double
    let diet: String
    let allergens: [String]
    let metricSystem: String
}
