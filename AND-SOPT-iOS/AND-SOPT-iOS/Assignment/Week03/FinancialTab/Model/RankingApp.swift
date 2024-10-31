//
//  RankingApp.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/31/24.
//

import Foundation
import UIKit

struct RankingApp {
    let appIcon: UIImage
    let ranking: String
    let appName: String
    let appDescription: String
    let buttonText: String
    let inAppPurchaseText: String?
}

extension RankingApp {
    static let paidApps: [RankingApp] = [
        RankingApp(appIcon: UIImage(named: "weple.png")!, ranking: "1", appName: "위플 가계부 Pro", appDescription: "아이폰 사용자 수 1위 가계부", buttonText: "₩14,000", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "gagyeboo.png")!, ranking: "2", appName: "편한 가계부 (광고 제거)", appDescription: "국내 1위 가계부", buttonText: "₩8,800", inAppPurchaseText: "앱 내 구입"),
        RankingApp(appIcon: UIImage(named: "membership.png")!, ranking: "3", appName: "멤버십 위젯 Pro", appDescription: "멤버십, 쿠폰, 포인트를 한번에 빠르게 할인/적립 받기", buttonText: "₩4,400", inAppPurchaseText: "앱 내 구입"),
        RankingApp(appIcon: UIImage(named: "binance.png")!, ranking: "4", appName: "Binance Smart Chain Explorer", appDescription: "Track BSC Addresses", buttonText: "₩4,400", inAppPurchaseText: "앱 내 구입"),
        RankingApp(appIcon: UIImage(named: "boan.png")!, ranking: "5", appName: "보안카드 위젯", appDescription: "초스피드 계좌이체", buttonText: "₩3,300", inAppPurchaseText: "앱 내 구입"),
        RankingApp(appIcon: UIImage(named: "binancePro.png")!, ranking: "6", appName: "BA Financial Calculator (PRO)", appDescription: "금융", buttonText: "₩4,400", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "costIt.png")!, ranking: "7", appName: "코스트잇", appDescription: "알뜰살뜰 소비 메모장", buttonText: "₩1,100", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "ba2.png")!, ranking: "8", appName: "BA II Plus™ Financial Calc", appDescription: "금융", buttonText: "₩22,000", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "easygagye.png")!, ranking: "9", appName: "편한가계부 Classic ( + PC 가계부 )", appDescription: "금융", buttonText: "₩8,800", inAppPurchaseText: nil)
    ]
    
    static let freeApps: [RankingApp] = [
        RankingApp(appIcon: UIImage(named: "silson.png")!, ranking: "1", appName: "실손24", appDescription: "간편한 실손보험 청구", buttonText: "받기", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "naverpay.png")!, ranking: "2", appName: "네이버페이", appDescription: "지갑 없이 매장에서 결제", buttonText: "받기", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "kakaopay.png")!, ranking: "3", appName: "카카오페이", appDescription: "마음 놓고 금융하다", buttonText: "받기", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "kbpay.png")!, ranking: "4", appName: "KB Pay", appDescription: "모든 금융을 한번에, 한손에, 한눈에 담다", buttonText: "받기", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "kbBank.png")!, ranking: "5", appName: "KB스타뱅킹", appDescription: "모바일 신분증, 결제, 통신도 다 되는 은행", buttonText: "받기", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "3jjum3.png")!, ranking: "6", appName: "삼쩜삼 - 세금 신고/환급 도우미", appDescription: "잠자고 있는 내 세금 얼마일까?", buttonText: "받기", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "hanabank.png")!, ranking: "7", appName: "하나은행", appDescription: "하나원큐는 돈기운 가득한 은행 앱, 송금, 해외송금, 유학생송금, 은행, KEB, 외환은행", buttonText: "받기", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "monimo.png")!, ranking: "8", appName: "monimo (모니모, 삼성금융네트웍스)", appDescription: "모이는 금융, 커지는 혜택! monimo 모니모", buttonText: "받기", inAppPurchaseText: nil),
        RankingApp(appIcon: UIImage(named: "nhallone.png")!, ranking: "9", appName: "NH올원뱅크", appDescription: "금융", buttonText: "받기", inAppPurchaseText: nil)
    ]
}
