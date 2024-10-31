//
//  FinancialTabMainViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/31/24.
//

import UIKit
import SnapKit

class FinancialTabMainViewController: UIViewController {
    
    // MARK: - Properties
    private let navigationBar = UINavigationBar()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // MARK: - Components
    private let recommendationView = RecommendationView()
    private let essentialFinancialView = EssentialFinancialView()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setNavigationStyle()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func setUI(){
        view.addSubviews(navigationBar, scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(recommendationView, essentialFinancialView)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        recommendationView.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.top)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        essentialFinancialView.snp.makeConstraints{
            $0.top.equalTo(recommendationView.snp.bottom).offset(20)
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
}
