//
//  FirstSectionApps.swift
//  2nd-Seminar
//
//  Created by MaengKim on 10/30/24.
//

import Foundation
import UIKit

struct FirstSectionApps {
    let category: String
    let name: String
    let info: String
    let appImage: UIImage
}

extension FirstSectionApps {
    static let firstSectionApps: [FirstSectionApps] = [
        FirstSectionApps(
            category: "새로운 앱", name: "Elk - 여행 환율 변환기", info: "언제 어디서나 간편한 환율 체크", appImage: .elk
        ),
        FirstSectionApps(
            category: "추천", name: "Taxnote 부기 및 회계 앱", info: "간편한 장부 관리", appImage: .taxnote
        ),
        FirstSectionApps(
            category: "새로운 경험", name: "Fortune City - A Finance App", info: "게임을 하듯 관리하는 가계부", appImage: .fortuneCity
        ),
        FirstSectionApps(
            category: "추천", name: "Currenzy", info: "빠르고 쉬운 환율 계산", appImage: .currenzy
        ),
    ]
}
