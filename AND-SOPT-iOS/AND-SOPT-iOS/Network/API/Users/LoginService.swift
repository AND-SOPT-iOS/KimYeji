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
        
        // 요청에 필요한 데이터를 LoginRequest 구조체로 설정
        let parameters = LoginRequest(username: username, password: password)
        
        // Alamofire를 사용하여 로그인 요청을 보냄
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { [weak self] response in
            
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                completion(.success(true))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        print("Status Code: \(statusCode), Error Code: \(errorCode)")
        
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest
        case (400, "01"):
            return .expressionError
        case (404, ""):
            return .invalidURL
        case (409, "00"):
            return .duplicateError
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
}
