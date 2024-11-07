import Foundation
import UIKit

struct App {
    let iconImage: UIImage
    let ranking: Int
    let category: String
    let title: String
    let subTitle: String
    let downloadState: DownloadState
}

extension App {
    static let sampleApps: [App] = [
        App(
            iconImage: .test, ranking: 0, category: "카카오톡", title: "ㅇㅇㅇ", subTitle: "subss", downloadState: .download
        ),
        App(
            iconImage: .test, ranking: 1, category: "카카오톡", title: "ㅇㅇㅇ", subTitle: "subss", downloadState: .download
        ),
        App(
            iconImage: .test, ranking: 2, category: "카카오톡", title: "ㅇㅇㅇ", subTitle: "subss", downloadState: .download
        ),
        App(
            iconImage: .test, ranking: 3, category: "카카오톡", title: "ㅇㅇㅇ", subTitle: "subss", downloadState: .download
        ),
        App(
            iconImage: .test, ranking: 4, category: "카카오톡", title: "ㅇㅇㅇ", subTitle: "subss", downloadState: .download
        ),
        App(
            iconImage: .test, ranking: 5, category: "카카오톡", title: "ㅇㅇㅇ", subTitle: "subss", downloadState: .download
        ),
        App(
            iconImage: .test, ranking: 6, category: "카카오톡", title: "ㅇㅇㅇ", subTitle: "subss", downloadState: .download
        ),
        App(
            iconImage: .test, ranking: 7, category: "카카오톡", title: "ㅇㅇㅇ", subTitle: "subss", downloadState: .download
        ),
    
    ]
}
