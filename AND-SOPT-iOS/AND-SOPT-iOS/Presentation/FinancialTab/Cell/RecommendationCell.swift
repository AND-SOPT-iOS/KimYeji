//
//  RecommendationCell.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class RecommendationCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "RecommendationCell"
    
    // MARK: - Components
    
    private let recommendationTitleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
        $0.textColor = .systemBlue
    }
    
    private let appNameLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .label
    }
    
    private let appDescriptionLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .systemGray
    }
    
    private let appIconImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    private let appBackgroundImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    private let appNameSmallLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .label
    }
    
    private let subTitleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
        $0.textColor = .darkGray
    }
    
    private let button = UIButton().then{
        $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemGray
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    
    private let inAppPurchaseLabel = UILabel().then{
        $0.text = "앱 내 구입"
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .systemGray
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
        contentView.addSubviews(
            appBackgroundImageView,
            recommendationTitleLabel,
            appNameLabel,
            appDescriptionLabel
        )
        
        appBackgroundImageView.addSubviews(
            appIconImageView,
            appNameSmallLabel,
            subTitleLabel,
            button,
            inAppPurchaseLabel
        )
        
    }
    
    private func setLayout() {
        recommendationTitleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        appNameLabel.snp.makeConstraints {
            $0.top.equalTo(recommendationTitleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(recommendationTitleLabel)
        }
        
        appDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(appNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(appNameLabel)
        }
        
        appBackgroundImageView.snp.makeConstraints {
            $0.top.equalTo(appDescriptionLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        appIconImageView.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(10)
            $0.size.equalTo(40)
        }
        
        appNameSmallLabel.snp.makeConstraints {
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(10)
            $0.centerY.equalTo(appIconImageView.snp.centerY).offset(-10)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(appNameSmallLabel)
            $0.top.equalTo(appNameSmallLabel.snp.bottom).offset(2)
        }
        
        button.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalTo(appIconImageView.snp.centerY)
            $0.width.equalTo(80)
            $0.height.equalTo(30)
        }
        
        inAppPurchaseLabel.snp.makeConstraints {
            $0.trailing.equalTo(button.snp.trailing)
            $0.top.equalTo(button.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    // MARK: - Bind
    func bind(_ recommendation: Recommendation) {
        recommendationTitleLabel.text = recommendation.title
        appNameLabel.text = recommendation.appName
        appDescriptionLabel.text = recommendation.appDescription
        appIconImageView.image = recommendation.appIcon
        appBackgroundImageView.image = recommendation.appBackgroundImage
        appNameSmallLabel.text = recommendation.appName
        subTitleLabel.text = recommendation.subtitle
        button.setTitle(recommendation.buttonText, for: .normal)
        inAppPurchaseLabel.isHidden = recommendation.inAppPurchaseText == nil
    }
}
