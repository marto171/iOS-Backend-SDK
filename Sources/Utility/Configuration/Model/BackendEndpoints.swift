//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 3.02.24.
//

import Foundation



/// @param type: The type of the endpoint
/// @param version: The version of the endpoint
/// @param string: String version of the endpoint
public struct BackendEndpoint {
    public let types: [BackendEndpointType]
    public let version: BackendEndpointVersion
    public let path: String
    var string: String {
        return "\(version)/\(path)"
    }
    
    public init(types: [BackendEndpointType], version: BackendEndpointVersion, path: String) {
        self.types = types
        self.version = version
        self.path = path
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
