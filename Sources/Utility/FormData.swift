//
//  FormData.swift
//
//
//  Created by Martin on 20.10.23.
//

import Foundation

struct FormData {
    static func generateBoundary() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    static func createBody(json: Data?, image: Data?, boundary: String) -> Data {
        var body = Data()
        
        if let json = json {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"name\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: application/json\r\n\r\n".data(using: .utf8)!)
            body.append(json)
        }
        
        if let image = image {
            body.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"photo\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
            body.append(image)
        }
        
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        return body
        
    }
}
