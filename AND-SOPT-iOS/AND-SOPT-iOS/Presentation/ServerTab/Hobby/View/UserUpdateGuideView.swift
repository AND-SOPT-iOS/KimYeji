//
//  UserUpdateGuideView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import UIKit
import SnapKit
import Then

class UserUpdateGuideView: UIView {
    // MARK: - UI Components
    private let userInfoUpdateTitleLabel = UILabel().then {
        $0.text = "🤠 유저 정보 변경하기"
        $0.font = .systemFont(ofSize: 25, weight: .bold)
    }
    
    let goToUserInfoUpdateButton = UIButton().then {
        $0.setTitle("😮 유저 정보 변경하러 가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemTeal
        $0.layer.cornerRadius = 10
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
        addSubviews(userInfoUpdateTitleLabel, goToUserInfoUpdateButton)
    }
    
    private func setLayout() {
        userInfoUpdateTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview()
        }
        
        goToUserInfoUpdateButton.snp.makeConstraints {
            $0.top.equalTo(userInfoUpdateTitleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}

