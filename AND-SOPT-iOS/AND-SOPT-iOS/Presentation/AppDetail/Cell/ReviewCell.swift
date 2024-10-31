//
//  ReviewCell.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/30/24.
//

import UIKit
import SnapKit
import Then

class ReviewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "ReviewCell"
    
    // MARK: - Components

    private let reviewBackgroundGrayView = UIView().then {
        $0.backgroundColor = .tertiarySystemBackground
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.layer.borderWidth = 0.5
    }
    
    private let reviewTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .label
    }
    
    private let reviewDateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .systemGray
    }
    
    private let userNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .systemGray
    }
    
    private let reviewStarScoreLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .label
    }
    
    private let reviewContentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .systemGray
        $0.numberOfLines = 3
    }
    
    private let developerResponseTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .label
        $0.text = "개발자 답변"
    }
    
    private let developerResponseDateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .systemGray
    }
    
    private let developerResponseContentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = .systemGray
        $0.numberOfLines = 2
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI, Layout
    private func setUI() {
        contentView.addSubview(reviewBackgroundGrayView)
        
        reviewBackgroundGrayView.addSubviews(
            reviewTitleLabel,
            reviewDateLabel,
            userNameLabel,
            reviewStarScoreLabel,
            reviewContentLabel,
            developerResponseTextLabel,
            developerResponseDateLabel,
            developerResponseContentLabel
        )
    }
    
    private func setLayout() {
        reviewBackgroundGrayView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        reviewTitleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(15)
        }
        
        reviewStarScoreLabel.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(15)
        }
        
        reviewDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(reviewStarScoreLabel.snp.centerY)
            $0.leading.equalTo(reviewStarScoreLabel.snp.trailing).offset(5)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.leading.equalTo(reviewDateLabel.snp.trailing).offset(5)
            $0.centerY.equalTo(reviewDateLabel)
        }
        
        reviewContentLabel.snp.makeConstraints {
            $0.top.equalTo(reviewStarScoreLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        developerResponseTextLabel.snp.makeConstraints {
            $0.top.equalTo(reviewContentLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(15)
        }
        
        developerResponseDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(developerResponseTextLabel.snp.centerY)
            $0.leading.equalTo(developerResponseTextLabel.snp.trailing).offset(5)
        }
        
        developerResponseContentLabel.snp.makeConstraints {
            $0.top.equalTo(developerResponseTextLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
    }
    
    // MARK: - Bind
    func bind(_ review: Review) {
        reviewTitleLabel.text = review.reviewTitle
        reviewStarScoreLabel.text = review.reviewStarScore
        reviewDateLabel.text = review.reviewDate
        userNameLabel.text = "• " + review.userName
        reviewContentLabel.text = review.reviewContent
        
        developerResponseDateLabel.text = review.developerResponse.developerResponseDate
        developerResponseContentLabel.text = review.developerResponse.developerResponseContent
    }
}
