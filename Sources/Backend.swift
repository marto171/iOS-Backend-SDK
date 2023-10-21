//
//  Backend.swift
//
//
//  Created by Martin on 20.10.23.
//


@MainActor public struct Backend {
    static let main: Backend = Backend()
    
    func login(config: Config, body: LoginRequest) async {
        let response: LoginResponse? = await Request.post(url: "\(config.baseUrl)/\(config.language)/api/v2/user/login", body: body)
        
        if let res = response {
            print(res)
        }
    }
}
