//
//  OtherHobbyService.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import Foundation
import Alamofire

// 다른 사람 취미 조회 API : /user/{no}/hobby
class OtherHobbyService {
    
    func fetchOtherHobby(userNo: Int, completion: @escaping (Result<String, NetworkError>) -> Void) {
        guard let token = KeychainManager.load(key: "userToken") else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let url = Environment.baseURL + "/user/\(userNo)/hobby"
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(url, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: HobbyResponse.self) { response in
                switch response.result {
                case .success(let hobbyResponse):
                    print(hobbyResponse.result.hobby)
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
