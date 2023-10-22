//
//  User.swift
//  
//
//  Created by Martin on 21.10.23.
//

import Foundation

public struct User: Codable {
    public let _id: String
    public var token: String?
    public var name: String
    public var email: String
    public var photo: String
    public var details: UserDetails?
}
