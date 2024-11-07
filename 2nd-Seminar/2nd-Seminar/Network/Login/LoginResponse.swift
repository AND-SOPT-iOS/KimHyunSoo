//
//  LoginResponse.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/7/24.
//

import Foundation

struct LoginResponse: Codable {
    let result: LoginResult
}

struct LoginResult: Codable {
    let token: String
}
