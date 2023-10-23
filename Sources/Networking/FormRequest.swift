//
//  FormRequests.swift
//  
//
//  Created by Martin on 20.10.23.
//

import Foundation
import UIKit

struct FormRequest {
    static func patchFormData<R: Codable>(url: String, json: Data? = nil, image: UIImage? = nil, authToken: String? = nil) async -> R? {
        let imageData: Data? = ImageMedia(withImage: image, key: "image").data
        let boundary: String = FormData.generateBoundary()
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "PATCH"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(authToken ?? "")", forHTTPHeaderField: "Authorization")
        request.httpBody = FormData.createBody(json: json, image: imageData, boundary: boundary)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData: R? = JSON.decode(data)
            return decodedData
        } catch {
            return nil
        }
    }
}
