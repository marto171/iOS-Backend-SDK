//
//  BasicRequests.swift
//
//
//  Created by Martin on 20.10.23.
//

import Foundation

struct Request {
    
    static func get<R: Codable>(url: String, authToken: String? = nil) async -> R? {
        print("GET URL: \(url)")
        
        var request = URLRequest(url: URL(string: url)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        request.setValue("Bearer \(authToken ?? "")", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData: R? = JSON.decode(data)
            print("RESPONSE DATA: \(String(describing: decodedData))")
            return decodedData
        } catch {
            return nil
        }
    }
    
    static func post<T: Codable, R: Codable>(url: String, body: T, authToken: String? = nil) async -> R? {
        print("POST URL: \(url)")
        
        let bodyData = JSON.encode(body)
        
        var request = URLRequest(url: URL(string: url)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = bodyData
        request.setValue("Bearer \(authToken ?? "")", forHTTPHeaderField: "Authorization")
        print("POST DATA: \(body)")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData: R? = JSON.decode(data)
            print("RESPONSE DATA: \(String(describing: decodedData))")
            return decodedData
        } catch {
            print("Failed to send POST Request: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func patch<T: Codable, R:Codable>(url: String, body: T, authToken: String? = nil) async ->R? {
        print("PATCH URL: \(url)")
        
        let bodyData = JSON.encode(body)
        
        var request = URLRequest(url: URL(string: url)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PATCH"
        request.httpBody = bodyData
        request.setValue("Bearer \(authToken ?? "")", forHTTPHeaderField: "Authorization")
        print("PATCH DATA: \(body)")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData: R? = JSON.decode(data)
            print("RESPONSE DATA: \(String(describing: decodedData))")
            return decodedData
        } catch {
            return nil
        }
    }
}
