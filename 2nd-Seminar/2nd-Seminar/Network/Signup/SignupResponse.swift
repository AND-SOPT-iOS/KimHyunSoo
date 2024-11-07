//
//  SignupResponse.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/7/24.
//

import Foundation

class SignupResponse: Codable {
    let result: ResponseResult
}

struct ResponseResult: Codable {
    let no: Int
}
