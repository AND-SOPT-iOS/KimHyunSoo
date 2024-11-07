//
//  MypageResponse.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/7/24.
//

import Foundation

struct MypageResponse: Codable {
    let result: HobbyResult
}

struct HobbyResult: Codable {
    let hobby: String
}
