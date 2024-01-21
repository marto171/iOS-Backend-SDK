//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 16.01.24.
//

import Foundation
import JSONCoder

class KeychainManager {
    
    enum KeychainError: Error {
        case unknown(OSStatus)
    }
    
    static func save(service: String, account: String, data: Data) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: data as AnyObject
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
        
        print("Data saved to keychain")
    }
    
    static func get(service: String, account: String) throws -> Data? {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
        
        if let data = dataTypeRef as? Data {
            print("Data recieved from Keychain")
            return data
        } else {
            print("Data not found in Keychain")
            return nil
        }
        
    }
    
    static func deleteFromKeychain(service: String, account: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]

        let status = SecItemDelete(query as CFDictionary)

        if status != errSecSuccess {
            print("Error deleting data from Keychain")
        }
        
        print("Data deleted from keychain!")
    }
    
    static func saveCustomObject<T: Codable>(service: String, account: String, object: T) {
        if let encodedData = JSONCoder.encode(object) {
            do {
                try Self.save(service: service, account: account, data: encodedData)
                print("Keychaing custom object successfully saved!")
            } catch {
                print("Error saving to keychain: \(error)")
            }
        }
    }
    
    static func getCustomObject<T: Codable>(service: String, account: String) -> T? {
        
        do {
            if let data = try Self.get(service: service, account: account), let decodedObject: T = JSONCoder.decode(data) {
                return decodedObject
            } else {
                print("Data from keychain could not be decoded")
            }
        } catch {
            print("Error getting data from keychain: \(error)")
        }
        
        return nil
    }
    
}
