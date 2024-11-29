//
//  MyHobbyService.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import Foundation
import Alamofire

// 내 취미 조회 API : /user/my-hobby
class MyHobbyService {
    
    func fetchMyHobby(completion: @escaping (Result<String, NetworkError>) -> Void) {
        guard let token = KeychainManager.load(key: "userToken") else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let url = Environment.baseURL + "/user/my-hobby"
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: HobbyResponse.self) { response in
                switch response.result {
                case .success(let hobbyResponse):
                    completion(.success(hobbyResponse.result.hobby))
                case .failure(let error):
                    print("취미 조회 실패: \(error)")
                    if let statusCode = response.response?.statusCode {
                        print("상태 코드: \(statusCode)")
                        completion(.failure(.unknownError))
                    }
                }
            }
    }
}
