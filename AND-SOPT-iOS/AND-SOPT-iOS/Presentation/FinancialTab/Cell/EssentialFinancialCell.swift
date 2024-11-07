//
//  EssentialFinancialCell.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class EssentialFinancialCell: UICollectionViewCell {
    static let identifier: String = "EssentialFinancialCell"
    
    // MARK: - Components
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.systemGray4.cgColor 
    }
    
    private let appNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .label
        $0.numberOfLines = 2
    }
    
    private let appDescriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .systemGray
    }
    
    private let downloadButton = UIButton().then {
        $0.setTitle("받기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.backgroundColor = .tertiarySystemFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    
    private let inAppPurchaseLabel = UILabel().then {
        $0.text = "앱 내 구입"
        $0.font = .systemFont(ofSize: 8, weight: .semibold)
        $0.textColor = .systemGray2
    }
    
    private let separatorLine = UIView().then {
        $0.backgroundColor = .systemGray4
    }
    
    // MARK: - Initializer
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
        addSubviews(iconImageView, appNameLabel, appDescriptionLabel, downloadButton, inAppPurchaseLabel, separatorLine)
    }
    
    private func setLayout(){
        iconImageView.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
            $0.size.equalTo(70)
        }
        
        appNameLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.centerY.equalTo(iconImageView.snp.centerY).offset(-10)
            $0.trailing.lessThanOrEqualTo(downloadButton.snp.leading).offset(-8)
        }
        
        appDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(appNameLabel)
            $0.top.equalTo(appNameLabel.snp.bottom).offset(2)
            $0.trailing.lessThanOrEqualTo(downloadButton.snp.leading).offset(-8)
            $0.bottom.lessThanOrEqualToSuperview().inset(12)
        }
        
        downloadButton.snp.makeConstraints{
            $0.centerY.equalTo(iconImageView.snp.centerY)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
        
        inAppPurchaseLabel.snp.makeConstraints {
            $0.top.equalTo(downloadButton.snp.bottom).offset(5)
            $0.centerX.equalTo(downloadButton)
        }
        
        separatorLine.snp.makeConstraints {
            $0.height.equalTo(0.4)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(5)
            $0.bottom.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Bind
    func bind(_ essentialFinancial: EssentialFinancialApp) {
        iconImageView.image = essentialFinancial.icon
        appNameLabel.text = essentialFinancial.appName
        appDescriptionLabel.text = essentialFinancial.appDescription
        downloadButton.setTitle(essentialFinancial.buttonText, for: .normal)
        inAppPurchaseLabel.text = essentialFinancial.inAppPurchaseText
    }
}
