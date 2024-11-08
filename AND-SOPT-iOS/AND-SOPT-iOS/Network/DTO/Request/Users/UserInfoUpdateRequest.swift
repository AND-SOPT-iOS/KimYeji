//
//  UserInfoUpdateRequest.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import Foundation

// 유저 정보 업데이트 API
struct UserInfoUpdateRequest: Codable {
    let hobby: String
    let password: String
}
