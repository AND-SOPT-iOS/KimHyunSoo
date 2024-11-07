//
//  LoginService.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/7/24.
//

import Foundation

import Alamofire

class LoginService {
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
