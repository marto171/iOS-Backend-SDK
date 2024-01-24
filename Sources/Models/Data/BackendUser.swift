//
//  BackendUser.swift
//  
//
//  Created by Martin on 21.10.23.
//

import Foundation

public class BackendUser: Codable {
    public var _id: String
    public var oauthProviderUserId: String?
    public var token: String?
    public var name: String
    public var email: String
    public var photo: String
    public var oauthProvider: String
    
    public init(_id: String, oauthProviderUserId: String? = nil, token: String? = nil, name: String, email: String, photo: String, oauthProvider: String) {
        self._id = _id
        self.oauthProviderUserId = oauthProviderUserId
        self.token = token
        self.name = name
        self.email = email
        self.photo = photo
        self.oauthProvider = oauthProvider
    }
}
