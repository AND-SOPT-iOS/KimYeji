//
//  Recommendation.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/31/24.
//

import UIKit

struct Recommendation {
    let title: String
    let appName: String
    let appDescription: String
    let appIcon: UIImage
    let appBackgroundImage: UIImage
    let subtitle: String
    let buttonText: String
    let inAppPurchaseText: String?
}

extension Recommendation {
    static let recommendationItems: [Recommendation] = [
        Recommendation(
            title: "추천",
            appName: "Currenzy",
            appDescription: "빠르고 쉬운 환율 계산",
            appIcon: UIImage(named: "currenzy.png")!,
            appBackgroundImage: UIImage(named: "samsung.png")!,
            subtitle: "금융",
            buttonText: "₩6,600",
            inAppPurchaseText: nil
        ),
        Recommendation(
            title: "새로운 경험",
            appName: "Fortune City - A Finance App",
            appDescription: "게임을 하듯 관리하는 가계부",
            appIcon: UIImage(named: "fortuneCity.png")!,
            appBackgroundImage: UIImage(named: "samsung.png")!,
            subtitle: "좋은 소비 습관을 만들어 보세요!",
            buttonText: "받기",
            inAppPurchaseText: "앱 내 구입"
        ),
        Recommendation(
            title: "새로운 앱",
            appName: "Elk - 여행 환율 변환기",
            appDescription: "언제 어디서나 간편한 환율 체크",
            appIcon: UIImage(named: "elk.png")!,
            appBackgroundImage: UIImage(named: "samsung.png")!,
            subtitle: "Winner of ADA 2017",
            buttonText: "받기",
            inAppPurchaseText: "앱 내 구입"
        ),
        Recommendation(
            title: "추천",
            appName: "Taxnote 부기 및 회계 앱",
            appDescription: "간편한 장부 관리",
            appIcon: UIImage(named: "taxNote.png")!,
            appBackgroundImage: UIImage(named: "cat.png")!,
            subtitle: "자영업자용 세금 환급을 위한 부기 및 회계 앱",
            buttonText: "받기",
            inAppPurchaseText: "앱 내 구입"
        )
    ]
}
