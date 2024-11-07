import Foundation
import UIKit

struct FreeRankingApps {
    let iconImage: UIImage
    let title: String
    let subTitle: String
    let downloadState: DownloadState
    let ranking: String
}

extension FreeRankingApps {
    static let freeRankingApps: [FreeRankingApps] = [
        FreeRankingApps(
            iconImage: .silson241, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download, ranking: "1"
        ),
        FreeRankingApps(
            iconImage: .naverpay, title: "네이버페이", subTitle: "지갑 없이 매장에서 결제", downloadState: .download, ranking: "2"
        ),
        FreeRankingApps(
            iconImage: .kakaopay, title: "카카오페이", subTitle: "마음 놓고 금융하다", downloadState: .update, ranking: "3"
        ),
        FreeRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download, ranking: "4"
        ),
        FreeRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download, ranking: "5"
        ),
        FreeRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download, ranking: "6"
        ),
        FreeRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download, ranking: "7"
        ),
        FreeRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download, ranking: "8"
        ),
        FreeRankingApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download, ranking: "9"
        )
    ]
}




