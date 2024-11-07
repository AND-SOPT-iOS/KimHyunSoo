import Foundation
import UIKit

struct PaidRankingApps {
    let iconImage: UIImage
    let title: String
    let subTitle: String
    let price: String
    let ranking: String
}

extension PaidRankingApps {
    static let paidRankingApps: [PaidRankingApps] = [
        PaidRankingApps(
            iconImage: .img, title: "위플 가계부 Pro", subTitle: "아이폰 사용자 수 1위 가계부", price: "￦14,000", ranking: "1"
        ),
        PaidRankingApps(
            iconImage: .img, title: "편한가계부(광고 제거)", subTitle: "국내 1위 가계부", price: "￦8,800", ranking: "2"
        ),
        PaidRankingApps(
            iconImage: .img, title: "멤버십 위젯 Pro", subTitle: "멤버십, 쿠폰, 포인트를 한번에 빠르게 할인/적립 하세요.", price: "￦4,400", ranking: "3"
        ),
        PaidRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", price: "￦14,000", ranking: "4"
        ),
        PaidRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", price: "￦14,000", ranking: "5"
        ),
        PaidRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", price: "￦14,000", ranking: "6"
        ),
        PaidRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", price: "￦14,000", ranking: "7"
        ),
        PaidRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", price: "￦14,000", ranking: "8"
        ),
        PaidRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", price: "￦14,000", ranking: "9"
        )
    ]
}



