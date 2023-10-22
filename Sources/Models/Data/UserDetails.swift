//
//  UserDetails.swift
//  
//
//  Created by Martin on 21.10.23.
//

import Foundation

public struct UserDetails: Codable {
    public let userId: String
    public let targetCalories: Double
    public let diet: String
    public let allergens: [String]
    public let metricSystem: String
}
