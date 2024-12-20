//
//  AppStoreTossMainViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/18/24.
//

import UIKit
import SnapKit

class AppStoreTossMainViewController: UIViewController {
    
    // MARK: - Properties
    private let navigationBar = UINavigationBar()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // MARK: - Components
    
    // 첫번째 섹션  - 앱 정보 헤더(앱 이름, 아이콘, 열기 버튼, 공유 버튼)
    private let appInfoHeaderView = AppInfoHeaderView()
    private lazy var separateLine1 = createSeparateLine()
    
    // 두번째 섹션 - 앱 정보 요약(평가 개수, 수상, 연령 정보)
    private let appInfoSummaryView = AppInfoSummaryView()
    private lazy var separateLine2 = createSeparateLine()
    
    
    // 세번째 섹션 - 새로운 소식(버전 정보)
    private let newNewsView = NewNewsView()
    private lazy var separateLine3 = createSeparateLine()
    
    
    // 네번째 섹션 - 미리 보기 이미지
    private let previewImageView = PreviewImageView()
    private lazy var separateLine4 = createSeparateLine()
    
    
    // 다섯번째 섹션 - 앱 상세정보(개발자 정보)
    private let appDescriptionView = AppDescriptionView()
    private lazy var separateLine5 = createSeparateLine()
    
    
    // 여섯번째 섹션 - 평가 및 리뷰
    private let ratingAndReviewView = RatingAndReviewView()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setDelegates()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .systemBackground
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
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        appInfoHeaderView.snp.makeConstraints{
            $0.top.equalTo(contentView.snp.top)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        separateLine1.snp.makeConstraints {
            $0.top.equalTo(appInfoHeaderView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        appInfoSummaryView.snp.makeConstraints {
            $0.top.equalTo(separateLine1.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        separateLine2.snp.makeConstraints {
            $0.top.equalTo(appInfoSummaryView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        newNewsView.snp.makeConstraints {
            $0.top.equalTo(separateLine2.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        separateLine3.snp.makeConstraints {
            $0.top.equalTo(newNewsView.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        previewImageView.snp.makeConstraints {
            $0.top.equalTo(separateLine3.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        separateLine4.snp.makeConstraints{
            $0.top.equalTo(previewImageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        appDescriptionView.snp.makeConstraints {
            $0.top.equalTo(separateLine4.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        separateLine5.snp.makeConstraints{
            $0.top.equalTo(appDescriptionView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        ratingAndReviewView.snp.makeConstraints {
            $0.top.equalTo(separateLine5.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func createSeparateLine() -> UIView {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }
    
    private func setDelegates() {
        ratingAndReviewView.delegate = self
        newNewsView.delegate = self
    }
}

// MARK: Delegate extension
extension AppStoreTossMainViewController: RatingAndReviewViewDelegate {
    func seeAllReviewsButtonTapped() {
        let allReviewsViewController = AllReviewsViewController()
        self.navigationController?.pushViewController(allReviewsViewController, animated: true)
    }
}

extension AppStoreTossMainViewController: NewNewsViewDelegate {
    func versionUpdateRecordButtonTapped() {
        let versionRecordViewController = VersionRecordViewController()
        self.navigationController?.pushViewController(versionRecordViewController, animated: true)
    }
}
