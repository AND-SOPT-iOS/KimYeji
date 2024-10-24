//
//  AppStoreTossMainViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/18/24.
//

import UIKit
import SnapKit

class AppStoreTossMainViewController: UIViewController {
    private let navigationBar = UINavigationBar()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    
    // MARK: 첫번째 섹션 (앱 이름, 아이콘, 열기 버튼, 공유 버튼)
    private let appInfoHeaderView = AppInfoHeaderView()
    
    private let separateLine1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: 두번째 섹션 (평가 개수, 수상, 연령)
    private let appInfoSummaryView = AppInfoSummaryView()
    
    private let separateLine2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: 세번째 섹션(새로운 소식)
    private let newNewsView = NewNewsView()
    
    private let separateLine3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: 네번째 섹션(미리 보기 이미지)
    private let previewImageView = PreviewImageView()
    
    private let separateLine4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: 다섯번째 섹션(앱 상세 정보, 개발자 정보)
    private let appDescriptionView = AppDescriptionView()
    
    private let separateLine5: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: 여섯번째 섹션 (평가 및 리뷰, 리뷰 내용) - 마지막
    private let ratingAndReviewView = RatingAndReviewView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationStyle()
        setStyle()
        setUI()
        setLayout()
    }
    
    
    private func setStyle() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .black
    }
    
    private func setUI(){
        view.addSubviews(navigationBar, scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(appInfoHeaderView, separateLine1,
                                appInfoSummaryView, separateLine2,
                                newNewsView, separateLine3,
                                previewImageView, separateLine4,
                                appDescriptionView, separateLine5,
                                ratingAndReviewView)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        // MARK: 첫번째 섹션
        appInfoHeaderView.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.top)
            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.height.greaterThanOrEqualTo(130)
        }
        
        separateLine1.snp.makeConstraints {
            $0.top.equalTo(appInfoHeaderView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 두번째 섹션
        appInfoSummaryView.snp.makeConstraints {
            $0.top.equalTo(separateLine1.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.height.greaterThanOrEqualTo(80)
        }
        
        separateLine2.snp.makeConstraints {
            $0.top.equalTo(appInfoSummaryView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 세번째 섹션
        newNewsView.snp.makeConstraints {
            $0.top.equalTo(separateLine2.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.height.greaterThanOrEqualTo(100)
        }
        
        separateLine3.snp.makeConstraints {
            $0.top.equalTo(newNewsView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 네번째 섹션
        previewImageView.snp.makeConstraints {
            $0.top.equalTo(separateLine3.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.height.greaterThanOrEqualTo(670)
        }
        
        separateLine4.snp.makeConstraints{
            $0.top.equalTo(previewImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 다섯번째 섹션
        appDescriptionView.snp.makeConstraints {
            $0.top.equalTo(separateLine4.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.height.greaterThanOrEqualTo(140)
        }
        
        separateLine5.snp.makeConstraints{
            $0.top.equalTo(appDescriptionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 여섯번째 섹션 (평가 및 리뷰 탭)
        ratingAndReviewView.snp.makeConstraints {
            $0.top.equalTo(separateLine5.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.height.greaterThanOrEqualTo(500)
            $0.bottom.equalTo(contentView)
        }
    }
    
    private func setNavigationStyle() {
        self.navigationController?.navigationBar.tintColor = .systemBlue
        self.navigationController?.navigationBar.barTintColor = .black
        
        self.title = "앱"
        
        let backImage = UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
    }
    
    // 나중에 옮기기
    @objc private func versionUpdateRecordButtonTapped(){
        let versionRecordViewController = VersionRecordViewController()
        self.navigationController?.pushViewController(versionRecordViewController, animated: true)
    }
    
    @objc private func seeAllReviewsButtonTapped(){
        let allReviewsViewController = AllReviewsViewController()
        self.navigationController?.pushViewController(allReviewsViewController, animated: true)
    }
}
