//
//  UserService.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/2/24.
//

import Foundation

import Alamofire

class UserService {

  func register(
    username: String,
    password: String,
    hobby: String,
    completion: @escaping (Result<SignupResponse, NetworkError>) -> Void
  ) {

    let url = Environment.baseURL + "/user"

    let parameters = SignupRequest(
      username: username,
      password: password,
      hobby: hobby
    )

    AF.request(
      url,
      method: .post,
      parameters: parameters,
      encoder: JSONParameterEncoder.default
    )
    .validate()
    .response { [weak self] response in
        print(response.data)
        print(response.response?.statusCode)
      guard let statusCode = response.response?.statusCode,
            let data = response.data,
            let self
      else {
        completion(.failure(.unknownError))
        return
      }

      switch response.result {
      case .success:
          do {
              let signupResponse = try JSONDecoder().decode(SignupResponse.self, from: data)
              completion(.success(signupResponse))
          } catch {
              completion(.failure(.decodingError))
          }
      case .failure:
        let error = self.handleStatusCode(statusCode, data: data)
        completion(.failure(error))
      }
    }
  }
    
    func login(
        username: String,
        password: String,
        completion: @escaping (Result<LoginResponse, NetworkError>) -> Void
    ){
        let url = Environment.baseURL + "/login"

        let parameters = LoginRequest(
          username: username,
          password: password
        )
        
        AF.request(
          url,
          method: .post,
          parameters: parameters,
          encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { [weak self] response in
            print(response.data)
            print(response.response?.statusCode)
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion(.success(loginResponse))
                } catch {
                    completion(.failure(.decodingError))
                }
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
            
        }
    }
    
    func getMyHobby(completion: @escaping (Result<MypageResponse, NetworkError>) -> Void
    ){
        let url = Environment.baseURL + "/user/my-hobby"
        guard let token = UserManager.shared.token else { return }
        let header: HTTPHeaders = ["token": token]
        
        AF.request(
            url,
            method: .get,
            headers: header
        )
        .validate()
        .response { [weak self] response in
            print(response.data)
            print(response.response?.statusCode)
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                do {
                    let response = try JSONDecoder().decode(MypageResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(.decodingError))
                }
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
            
        }
    }
    
    func updateUserInfo(hobby: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        
        let url = Environment.baseURL + "/user"
        guard let token = UserManager.shared.token else { return }
        let header: HTTPHeaders = ["token": token]
        
        let parameters = UserupdateRequest(
          hobby: hobby,
          password: password
        )
        
        AF.request(
            url,
            method: .put,
            parameters: parameters,
            encoder: JSONParameterEncoder.default,
            headers: header
        )
        .validate()
        .response { [weak self] response in
            print(response.data)
            print(response.response?.statusCode)
            guard let statusCode = response.response?.statusCode,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure:
                if let data = response.data {
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                }
            }
            
        }
        
    }
    //넘버값을 textfield로 받아서 넘겨버리기
    
    func getOtherHobby(num: Int, completion: @escaping (Result<SearchResponse, NetworkError>) -> Void
    ){
        let url = Environment.baseURL + "/user/\(num)/hobby"
        guard let token = UserManager.shared.token else { return }
        let header: HTTPHeaders = ["token": token]
        
        AF.request(
            url,
            method: .get,
            headers: header
        )
        .validate()
        .response { [weak self] response in
            print(response.data)
            print(response.response?.statusCode)
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                do {
                    let response = try JSONDecoder().decode(SearchResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(.decodingError))
                }
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
