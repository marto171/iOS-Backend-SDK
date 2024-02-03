//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 3.02.24.
//

import Foundation



/// @param type: .getUser
/// @param version: .v1
/// @param path: "/user/me"
/// @param string: String version of the endpoint
public struct BackendEndpoint {
    public let types: [BackendEndpointType]
    public let version: BackendEndpointVersion
    public let path: String
    public let parameters: [String: String]
    var string: String {
        var finalPath: String = path
        for (key, value) in parameters {
            finalPath = finalPath.replacingOccurrences(of: "{\(key)}", with: "\(value)")
        }
        return "\(version)\(finalPath)"
    }
    
    public init(types: [BackendEndpointType], version: BackendEndpointVersion, path: String, parameters: [String: String]) {
        self.types = types
        self.version = version
        self.path = path
        self.parameters = parameters
    }
}


/// @param baseUrl: "https://example.com"
/// @param constantPrefix: "/en/api/"
/// @param endpoints: Array of endpoint objects
public struct BackendEndpoints {
    
    public let baseUrl: String
    public let constantPrefix: String?
    public let endpoints: [BackendEndpoint]
    
    public init(baseUrl: String, constantPrefix: String?, endpoints: [BackendEndpoint]) {
        self.baseUrl = baseUrl
        self.constantPrefix = constantPrefix
        self.endpoints = endpoints
    }

}
