//
//  FinancialTabMainViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/31/24.
//

import UIKit
import SnapKit

class FinancialTabMainViewController: UIViewController {
    // MARK: - Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let recommendationView = RecommendationView()
    private let essentialFinancialView = EssentialFinancialView()
    private let paidChartView = PaidChartView()
    private let freeChartView = FreeChartView()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setNavigationStyle()
        setDelegates()
    }
    
    // MARK: - Style, UI, Layout
    private func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUI() {
        view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(recommendationView, essentialFinancialView, paidChartView, freeChartView)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        recommendationView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        essentialFinancialView.snp.makeConstraints {
            $0.top.equalTo(recommendationView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        paidChartView.snp.makeConstraints {
            $0.top.equalTo(essentialFinancialView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        freeChartView.snp.makeConstraints {
            $0.top.equalTo(paidChartView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - 네비게이션 스타일 설정
    private func setNavigationStyle() {
        self.navigationController?.navigationBar.tintColor = .systemBlue
        self.navigationController?.navigationBar.barTintColor = .systemBackground
        self.title = "금융"
        
        let backImage = UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
    }
    
    // MARK: - Delegate
    private func setDelegates() {
        freeChartView.delegate = self
        freeChartView.cellDelegate = self
    }
}

// MARK: - Delegate extension
extension FinancialTabMainViewController: RankAppCollectionCellDelegate {
    func downloadButtonTapped(for app: RankingApp) {
        if app.appName == "토스" {
            let tossViewController = AppStoreTossMainViewController()
            navigationController?.pushViewController(tossViewController, animated: true)
        }
    }
}

extension FinancialTabMainViewController: FreeChartViewDelegate {
    func freeChartMoreButtonTapped() {
        let chartViewController = ChartViewController()
        navigationController?.pushViewController(chartViewController, animated: true)
    }
}
