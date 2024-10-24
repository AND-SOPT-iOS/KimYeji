//
//  NewNewsView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/24/24.
//

import UIKit

class NewNewsView: UIView {
    // MARK: 새로운 소식, 버전기록 
    
    private let newNewsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let versionTextLabel: UILabel = {
        let label = UILabel()
        label.text = "버전 5.185.0"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let versionUpdateDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2일 전"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemGray
        return label
    }()
    
    private let versionUpdateRecordButton: UIButton = {
        let button = UIButton()
        button.setTitle("버전 기록", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.systemBlue, for: .normal)
//        button.addTarget(nil, action: #selector(versionUpdateRecordButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let versionUpdateDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다.  365일 24시간 언제든지요."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .black
    }
    
    private func setUI() {
        addSubviews(newNewsTitleLabel, versionTextLabel, versionUpdateDateLabel, versionUpdateRecordButton, versionUpdateDescriptionLabel)
    }
    
    private func setLayout() {
        newNewsTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        versionUpdateRecordButton.snp.makeConstraints{
            $0.centerY.equalTo(newNewsTitleLabel.snp.centerY)
            $0.trailing.equalToSuperview()
        }
        
        versionTextLabel.snp.makeConstraints{
            $0.top.equalTo(newNewsTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        versionUpdateDateLabel.snp.makeConstraints{
            $0.centerY.equalTo(versionTextLabel.snp.centerY)
            $0.trailing.equalToSuperview()
        }
        
        versionUpdateDescriptionLabel.snp.makeConstraints{
            $0.top.equalTo(versionTextLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
