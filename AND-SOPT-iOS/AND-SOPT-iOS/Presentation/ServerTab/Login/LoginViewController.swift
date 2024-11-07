//
//  LoginViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import UIKit

class LoginViewController: UIViewController {
    private let loginView = LoginView()
    private let loginService = LoginService()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setActions()
    }
    
    // MARK: - UI, Layout
    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(loginView)
    }
    
    private func setLayout(){
        loginView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    // MARK: - Actions
    private func setActions() {
        loginView.loginButton.addTarget(self, action: #selector(handleLoginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func handleLoginButtonTapped() {
        guard let username = loginView.usernameTextField.text, !username.isEmpty,
              let password = loginView.passwordTextField.text, !password.isEmpty else {
            loginView.resultLabel.text = "😭 유저 이름과 비밀번호를 모두 작성해주세요."
            return
        }
        
        loginService.login(username: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success:
                    self.loginView.resultLabel.text = "😻 로그인 성공!"
                case .failure(let error):
                    self.loginView.resultLabel.text = error.errorMessage
                }
            }
        }
    }
}
