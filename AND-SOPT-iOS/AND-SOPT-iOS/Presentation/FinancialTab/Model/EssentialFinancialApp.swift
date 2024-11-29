//
//  App.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/31/24.
//

import Foundation
import UIKit

struct EssentialFinancialApp {
    let icon: UIImage
    let appName: String
    let appDescription: String
    let buttonText: String
    let inAppPurchaseText: String?
}

extension EssentialFinancialApp {
    static let essentialFinancialApps: [EssentialFinancialApp] = [
        EssentialFinancialApp(icon: UIImage(named: "moneycontrol.png")!,
                              appName: "Money Control Spending Tracker",
                              appDescription: "금융",
                              buttonText: "받기",
                              inAppPurchaseText: "앱 내 구입"),
        
        EssentialFinancialApp(icon: UIImage(named: "ynab.png")!,
                              appName: "YNAB",
                              appDescription: "금융",
                              buttonText: "받기",
                              inAppPurchaseText: "앱 내 구입"),
        
        EssentialFinancialApp(icon: UIImage(named: "splitwise.png")!,
                              appName: "Splitwise",
                              appDescription: "금융",
                              buttonText: "받기",
                              inAppPurchaseText: "앱 내 구입"),
        EssentialFinancialApp(icon: UIImage(named: "iFinance.png")!,
                              appName: "iFinance 5",
                              appDescription: "금융",
                              buttonText: "₩29,000",
                              inAppPurchaseText: "앱 내 구입"),
        
        EssentialFinancialApp(icon: UIImage(named: "moneyCoach.png")!,
                              appName: "Money Coach Budget Manager Pro",
                              appDescription: "Expense Tracker, Bill Planner",
                              buttonText: "받기",
                              inAppPurchaseText: "앱 내 구입"),
        
        EssentialFinancialApp(icon: UIImage(named: "finances2.png")!,
                              appName: "Finances 2",
                              appDescription: "금융",
                              buttonText: "받기",
                              inAppPurchaseText: "앱 내 구입"),
        
        EssentialFinancialApp(icon: UIImage(named: "spendy.png")!,
                              appName: "Spendy - Spendings reimagined",
                              appDescription: "금융",
                              buttonText: "₩4,400",
                              inAppPurchaseText: nil),
        
        EssentialFinancialApp(icon: UIImage(named: "cashCounter.png")!,
                              appName: "CashCounter : The cash manager",
                              appDescription: "금융",
                              buttonText: "받기",
                              inAppPurchaseText: "앱 내 구입"),
        
        EssentialFinancialApp(icon: UIImage(named: "macaw.png")!,
                              appName: "Macaw: Budget & Save Money",
                              appDescription: "금융",
                              buttonText: "받기",
                              inAppPurchaseText: "앱 내 구입")
    ]
}
