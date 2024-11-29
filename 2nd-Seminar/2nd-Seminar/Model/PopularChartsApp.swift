import UIKit

struct PopularChartsApp {
    let iconImage: UIImage
    let ranking: Int
    let title: String
    let subTitle: String
    let downloadState: DownloadState
}

extension PopularChartsApp {
    static let popularApps: [PopularChartsApp] = [
        PopularChartsApp(
            iconImage: .silson241, ranking: 1, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .naverpay, ranking: 2, title: "네이버페이", subTitle: "지값 없이 매장에서 결제", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .kakaopay, ranking: 3, title: "카카오페이", subTitle: "마음 놓고 금융하다", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 4, title: "삼쩜삼-세금 신고/환급 도우미", subTitle: "잠자고 있는 내 세금 얼마일까?", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .monimo, ranking: 5, title: "monimo(모니모,삼성금융네트웍스)", subTitle: "모이는 금융, 커지는 혜택1 monimo 모니모 삼성카드,삼성생명,삼성화재,삼성증권 앱을 하나로 모았습니다.", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .toss, ranking: 6, title: "토스", subTitle: "금융이 쉬워진다", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .kbpay, ranking: 7, title: "KB Pay", subTitle: "모든 금융을 한번에, 한손에, 한눈에 담다.", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 8, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 9, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 10, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 11, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 12, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .hyundaicard1, ranking: 13, title: "현대카드", subTitle: "금융", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .kakaobank1, ranking: 14, title: "카카오뱅크", subTitle: "이미 모두의 은행", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 15, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 16, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 17, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .hyundaidepartment1, ranking: 18, title: "현대백화점", subTitle: "금융", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 19, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 20, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        )
    ]
}
