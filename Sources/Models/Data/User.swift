//
//  User.swift
//  
//
//  Created by Martin on 21.10.23.
//

import Foundation

struct User: Codable {
    let _id: String
    var token: String?
    var name: String
    var email: String
    var photo: String
    var details: UserDetails?
}
