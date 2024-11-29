//
//  Environment.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/7/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
