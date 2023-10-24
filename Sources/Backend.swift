//
//  Backend.swift
//
//
//  Created by Martin on 20.10.23.
//

import Foundation

public struct Backend {
    public var config: BackendConfig?
    
    public static var shared: Backend = Backend()
    
    private init() {}
}
