//
//  LoginService.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import Foundation
import Alamofire

// 로그인 API - /login
class LoginService {
    func login(username: String, password: String, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        let url = Environment.baseURL + "/login"
        let parameters = LoginRequest(username: username, password: password)
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .responseDecodable(of: LoginResponse.self) { [weak self] response in
            
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success(let loginResponse):
                let token = loginResponse.result.token
                if KeychainManager.save(key: "userToken", token: token) {
                    print("토큰 저장 성공")
                    completion(.success(true))
                } else {
                    print("토큰 저장 실패")
                    completion(.failure(.unknownError))
                }
            case .failure:
                let error = NetworkUtils.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
}
