//
//  RegisterRequest.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/2/24.
//

import Foundation

struct SignupRequest: Codable {
    let username: String
    let password: String
    let hobby: String
}
