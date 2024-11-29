//
//  TabBarController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/7/24.
//

import UIKit
import SwiftUI

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: - TabBar 설정
    private func setupTabBar() {
        let financialTabMainViewController = FinancialTabMainViewController()
        let chartViewController = ChartViewController()
        let signUpViewController = SignUpViewController()
        let chartSwiftUIView = ChartView()
        
        let financialNavicationController = UINavigationController(rootViewController: financialTabMainViewController)
        let chartNavigationController = UINavigationController(rootViewController: chartViewController)
        let signUpNavigationController = UINavigationController(rootViewController: signUpViewController)
        let chartSwiftUIHostingController = UIHostingController(rootView: chartSwiftUIView)
        
        financialNavicationController.tabBarItem = UITabBarItem(title: "금융", image: UIImage(systemName: "wonsign"), tag: 0)
        chartNavigationController.tabBarItem = UITabBarItem(title: "차트", image: UIImage(systemName: "chart.bar.doc.horizontal"), tag: 1)
        chartSwiftUIHostingController.tabBarItem = UITabBarItem(title: "차트(스유)", image: UIImage(systemName: "chart.bar.doc.horizontal"), tag: 2)
        signUpViewController.tabBarItem = UITabBarItem(title: "서버", image: UIImage(systemName: "heart.fill"), tag: 3)
        
        self.viewControllers = [financialNavicationController, chartNavigationController, chartSwiftUIHostingController, signUpNavigationController]
    }
}
