//
//  SearchResponse.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/7/24.
//

import Foundation

struct SearchResponse: Codable {
    let result: SearchResult
}

struct SearchResult: Codable {
    let hobby: String
}
