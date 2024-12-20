//
//  SignUpView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import UIKit
import SnapKit
import Then

protocol SignUpViewDelegate: AnyObject {
    func signUpButtonTapped(username: String?, password: String?, hobby: String?)
    func loginButtonTapped()
}

class SignUpView: UIView {
    weak var delegate: SignUpViewDelegate?
    
    // MARK: - Components
    private var userNameTextField = UITextField().then {
        $0.placeholder = "유저 이름을 입력하세요"
        $0.font = .systemFont(ofSize: 15)
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    private var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요"
        $0.font = .systemFont(ofSize: 15)
        $0.isSecureTextEntry = true
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    private var hobbyTextField = UITextField().then {
        $0.placeholder = "취미를 입력하세요"
        $0.font = .systemFont(ofSize: 15)
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
    }
    
    private lazy var signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemOrange
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    private lazy var loginButton = UIButton().then{
        $0.setTitle("로그인 하러가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBrown
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    let resultLabel = UILabel().then {
        $0.textColor = .systemRed
        $0.text = "🚨 8자 이하로 입력해주세요"
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
        addSubviews(userNameTextField, passwordTextField, hobbyTextField, signUpButton, loginButton, resultLabel)
    }
    
    private func setLayout() {
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    @objc private func signUpButtonTapped() {
        delegate?.signUpButtonTapped(username: userNameTextField.text, password: passwordTextField.text, hobby: hobbyTextField.text)
    }
    
    @objc private func loginButtonTapped() {
        delegate?.loginButtonTapped()
    }
}
