//
//  RegisterRequest.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/7/24.
//

import Foundation

/// 유저 등록 API
struct RegisterRequest: Codable {
  let username: String
  let password: String
  let hobby: String
}
