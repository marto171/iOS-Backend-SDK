//
//  JSON.swift
//  
//
//  Created by Martin on 20.10.23.
//

import Foundation

struct JSON {
    static func encode<T: Codable>(_ object: T) -> Data? {
        do {
            return try JSONEncoder().encode(object)
        } catch {
            print("Failed to encode JSON Data: \(error)")
            return nil
        }
    }
    
    static func decode<T:Codable>(_ data: Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Failed to decode JSON Data: \(error)")
            return nil
        }
    }
}
