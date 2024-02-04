//
//  Backend.swift
//
//
//  Created by Martin on 20.10.23.
//

import Foundation

@MainActor
public struct Backend {
    public var config: BackendConfig?
    
    public static var shared: Backend = Backend()
    
    var backendVariables: BackendVariables = .init()
    
    private init() {}
    
    // Endpoints
    func getEndpoint(for endpointType: BackendEndpointType, parameters: [String: String]? = nil) -> String {
        guard let config else {
            return "No config provided!"
        }
        let endpoint = config.backendUrls.endpoints.first(where: { $0.types.contains(endpointType) })
        if var endpoint {
            endpoint.parameters = parameters
            return "\(config.backendUrls.baseUrl)\(config.backendUrls.constantPrefix ?? "")\(endpoint.string)"
        } else {
            fatalError("NO URL OF TYPE: \(endpointType) FOUND. YOU NEED TO ADD IT IN THE BACKEND CONFIG OBJECT!")
        }
    }
    
    func getBackendError(_ type: BackendErrorType) -> BackendError<String>? {
        guard let config = Backend.shared.config else {
            return nil
        }
        
        if !config.errors.isEmpty {
            let errorsNotLocalized = config.errors.first(where: { $0.type == type })?.localizedDescription
            
            if let errorsNotLocalized {
                let error = errorsNotLocalized.first(where: { $0.language == config.language })
                
                if let error = error {
                    return BackendError(type: type, localizedDescription: error.localizedDescription)
                }
            }
        }
        return nil
    }
    
    func getResponseError(ofType type: BackendErrorType, fallbackMessage: String?) -> BackendError<String> {
        let defaultError = K.SDKError.noAPIConnectionError.localizedDescription
        return self.getBackendError(type) ?? BackendError(type: .Custom, localizedDescription: fallbackMessage ?? defaultError)
    }
}
