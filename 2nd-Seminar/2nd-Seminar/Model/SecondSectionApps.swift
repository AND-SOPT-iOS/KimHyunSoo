//
//  SecondSectionApps.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/1/24.
//

import Foundation

import UIKit

struct SecondSectionApps {
    let iconImage: UIImage
    let title: String
    let subTitle: String
    let downloadState: DownloadState
}

extension SecondSectionApps {
    static let secondSectionApps: [SecondSectionApps] = [
        SecondSectionApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download
        ),
        SecondSectionApps(
            iconImage: .img, title: "Splitwise", subTitle: "금융", downloadState: .download
        ),
        SecondSectionApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download
        ),
        SecondSectionApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download
        ),
        SecondSectionApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download
        ),
        SecondSectionApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download
        ),
        SecondSectionApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download
        ),
        SecondSectionApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download
        ),
        SecondSectionApps(
            iconImage: .img, title: "Fin-가계부 및 예산 추적기", subTitle: "당신의 돈은 어디로 가고 있을까요?", downloadState: .download
        )
    ]
}



