//
//  UserUpdateView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

// UserUpdateView.swift

import UIKit
import SnapKit
import Then

class UserInfoUpdateView: UIView {
    // MARK: - Components
    private let userUpdateInfoTitleLabel = UILabel().then{
        $0.text = "😮 사용자 정보 변경"
        $0.font = .systemFont(ofSize: 25 , weight: .bold)
        $0.textAlignment = .center
    }
    
    let hobbyTextField = UITextField().then {
        $0.placeholder = "새로운 취미를 입력하세요."
        $0.layer.cornerRadius = 7
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
    }
    
    let passwordTextField = UITextField().then {
        $0.placeholder = "새로운 비밀번호를 입력하세요."
        $0.isSecureTextEntry = true
        $0.layer.cornerRadius = 7
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
    }
    
    let updateButton = UIButton().then {
        $0.setTitle("🤫 정보 변경하기", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 8
        $0.setTitleColor(.white, for: .normal)
    }
    
    let resultLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 18)
        $0.textAlignment = .center
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
        addSubviews(userUpdateInfoTitleLabel, hobbyTextField, passwordTextField, updateButton, resultLabel)
    }
    
    private func setLayout() {
        userUpdateInfoTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview()
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(userUpdateInfoTitleLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        updateButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(updateButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
