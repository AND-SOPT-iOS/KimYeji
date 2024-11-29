//
//  KeychainManager.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import Foundation

class KeychainManager {
    private init() {}
    
    // Create or Update
    // 특정 key에 대한 데이터를 Keychain에 저장, 업데이트
    class func save(key: String, token: String) -> Bool {
        let data = token.data(using: .utf8, allowLossyConversion: false)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,   // Keychain 저장 형식
            kSecAttrAccount as String: key,                  // 저장할 데이터의 Key
            kSecValueData as String: data                    // 실제 저장할 데이터
        ]
        
        // 기존 값이 있으면 업데이트, 없으면 새로 저장
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status == errSecSuccess {
            return true
        } else {
            print("Status code: \(status)")
            return false
        }
    }
    
    
    // Read
    // Keychain에서 데이터 불러오기
    class func load(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword, // 검색 형식
            kSecAttrAccount as String: key, // key 값
            kSecReturnData as String: kCFBooleanTrue!, // 데이터 반환 여부
            kSecMatchLimit as String: kSecMatchLimitOne // 결과 개수 제한
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess, let retrievedData = dataTypeRef as? Data {
            return String(data: retrievedData, encoding: .utf8)
        } else {
            print("Status code: \(status)")
            return nil
        }
    }
    
    // Delete
    // Keychain에서 데이터 삭제
    class func delete(key: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword, // 검색 항목
            kSecAttrAccount as String: key // 삭제하려는 데이터의 key 값 
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        if status == errSecSuccess {
            return true
        } else {
            print("Status code: \(status)")
            return false
        }
    }
}
