//
//  Environment.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/2/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
