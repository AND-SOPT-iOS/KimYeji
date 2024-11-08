//
//  LoginView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import UIKit
import SnapKit
import Then

protocol LoginViewDelegate: AnyObject {
    func loginButtonTapped(username: String?, password: String?)
}

class LoginView: UIView {
    weak var delegate: LoginViewDelegate?
    
    // MARK: - Components
    
    private var usernameTextField = UITextField().then {
        $0.placeholder = "유저 이름을 입력하세요"
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
    }
    
    private var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요"
        $0.isSecureTextEntry = true
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
    }
    
    private lazy var loginButton = UIButton(type: .system).then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .systemOrange
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    let resultLabel = UILabel().then {
        $0.textColor = .systemRed
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
        addSubviews(usernameTextField, passwordTextField, loginButton, resultLabel)
    }
    
    private func setLayout() {
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Actions
    @objc private func loginButtonTapped() {
        delegate?.loginButtonTapped(username: usernameTextField.text, password: passwordTextField.text)
    }
}
