//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 24.10.23.
//

import Foundation

public protocol PersistableUser: Codable {
    var _id: String { get set }
    var token: String? { get set }
    var name: String { get set }
    var email: String { get set }
    var photo: String { get set }
}
