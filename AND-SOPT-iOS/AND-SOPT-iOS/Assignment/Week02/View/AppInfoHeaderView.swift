//
//  AppInfoHeaderView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/24/24.
//

import UIKit

class AppInfoHeaderView: UIView {
    // MARK: - Components

    private let appImageImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "toss.png")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor.systemGray4.cgColor
        image.layer.masksToBounds = true

        return image
    }()
    
    private let appTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "토스"
        label.font = .systemFont(ofSize: 23 , weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private let appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "금융이 쉬워진다"
        label.font = .systemFont(ofSize: 17 , weight: .medium)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let openButton: UIButton = {
        let button = UIButton()
        button.setTitle("열기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 17
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        let shareIcon = UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(shareIcon, for: .normal)
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
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
        addSubviews(appImageImageView, appTitleLabel, appDescriptionLabel, openButton, shareButton)
    }
    
    private func setLayout() {
        appImageImageView.snp.makeConstraints {
            $0.verticalEdges.leading.equalToSuperview()
            $0.size.equalTo(120)
        }
        
        appTitleLabel.snp.makeConstraints {
            $0.top.equalTo(appImageImageView.snp.top)
            $0.leading.equalTo(appImageImageView.snp.trailing).offset(20)
        }
        
        appDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(appTitleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(appTitleLabel.snp.leading)
        }
        
        openButton.snp.makeConstraints {
            $0.leading.equalTo(appTitleLabel.snp.leading)
            $0.bottom.equalTo(appImageImageView.snp.bottom) 
            $0.width.equalTo(75)
            $0.height.equalTo(35)
        }
        
        shareButton.snp.makeConstraints {
            $0.centerY.equalTo(openButton.snp.centerY)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(30)
        }
    }

}
