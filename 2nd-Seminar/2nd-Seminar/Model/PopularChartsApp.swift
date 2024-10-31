//
//  PopularChartsApp.swift
//  2nd-Seminar
//
//  Created by MaengKim on 10/31/24.
//

import Foundation
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
            iconImage: .img, ranking: 1, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 2, title: "네이버페이", subTitle: "지값 없이 매장에서 결제", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 3, title: "카카오페이", subTitle: "마음 놓고 금융하다", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 4, title: "삼쩜삼-세금 신고/환급 도우미", subTitle: "잠자고 있는 내 세금 얼마일까?", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 5, title: "KB Pay", subTitle: "모든 금융을 한번에, 한손에, 한눈에 담다", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .toss, ranking: 6, title: "토스", subTitle: "금융이 쉬워진다", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 7, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
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
            iconImage: .img, ranking: 13, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 14, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
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
            iconImage: .img, ranking: 18, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 19, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        ),
        PopularChartsApp(
            iconImage: .img, ranking: 20, title: "실손24", subTitle: "간편한 실손보험 청구", downloadState: .download
        )
    ]
}
