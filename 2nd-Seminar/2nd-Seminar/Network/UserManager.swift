//
//  UserManager.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/7/24.
//

import Foundation

import KeychainAccess

class UserManager {
    static let shared = UserManager() //싱글톤
    
    private let keyChain = Keychain(service: "2nd-Seminar")
    
    var token: String? {
        get { return keyChain["token"] }
        set { keyChain["token"] = newValue }
    }
    
    func updateToken(_ token: String ) {
        self.token = token
    }
}
