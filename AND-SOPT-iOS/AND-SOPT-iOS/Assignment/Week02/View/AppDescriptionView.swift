//
//  AppDescriptionView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/24/24.
//

import UIKit

class AppDescriptionView: UIView {
    // MARK: - Components
    
    private let appInstallLabel: UILabel = {
        let label = UILabel()
        label.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가\n필요합니다."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        
        return label
    }()
    
    private let appInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "● 내 금융 현황을 한눈에, 홈·소비"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private let appInfoMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.addTarget(nil, action: #selector(appInfoMoreButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let devloperInfoTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Viva Republica", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return button
    }()
    
    private let developerAppMoreButton: UIButton = {
        let button = UIButton()
        let shareIcon = UIImage(systemName: "chevron.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(shareIcon, for: .normal)
        button.tintColor = .lightGray
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }()
    
    private let developerTextLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .lightGray
        
        return label
    }()
    
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
        addSubviews(
            appInstallLabel, appInfoLabel, appInfoMoreButton,
            devloperInfoTextButton, developerTextLabel, developerAppMoreButton
        )
    }
    
    private func setLayout() {
        appInstallLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview()
        }
        
        appInfoLabel.snp.makeConstraints {
            $0.top.equalTo(appInstallLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview()
        }
        
        appInfoMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(appInfoLabel.snp.centerY)
            $0.trailing.equalToSuperview()
        }
        
        devloperInfoTextButton.snp.makeConstraints {
            $0.top.equalTo(appInfoLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        developerTextLabel.snp.makeConstraints {
            $0.top.equalTo(devloperInfoTextButton.snp.bottom).offset(-3)
            $0.leading.equalTo(devloperInfoTextButton.snp.leading)
        }
        
        developerAppMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(devloperInfoTextButton.snp.centerY)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    @objc private func appInfoMoreButtonTapped() {
        appInfoLabel.text = AppInfoText.appInfoDescription
        appInfoMoreButton.isHidden = true
    }
}
