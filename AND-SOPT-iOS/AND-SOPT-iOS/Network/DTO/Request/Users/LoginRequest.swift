//
//  LoginRequest.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import Foundation

// 로그인 API
struct LoginRequest: Codable {
    let username: String
    let password: String
}
