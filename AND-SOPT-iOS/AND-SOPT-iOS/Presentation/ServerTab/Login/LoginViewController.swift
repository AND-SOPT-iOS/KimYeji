//
//  LoginViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import UIKit

class LoginViewController: UIViewController {
    private let loginView = LoginView()
    private let authService = AuthService()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegates()
    }
    
    // MARK: - UI, Layout
    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(loginView)
    }
    
    private func setLayout(){
        loginView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    // MARK: - Delegates
    private func setDelegates(){
        loginView.delegate = self
    }
}

// MARK: - Delegate extension
extension LoginViewController: LoginViewDelegate {
    func loginButtonTapped(username: String?, password: String?) {
        guard let username = username, !username.isEmpty,
              let password = password, !password.isEmpty else {
            loginView.resultLabel.text = "😭 유저 이름과 비밀번호를 모두 작성해주세요."
            return
        }
        
        authService.login(username: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success:
                    self.loginView.resultLabel.text = "😻 로그인 성공!"
                    let myHobbyViewController = HobbyViewController()
                    self.navigationController?.pushViewController(myHobbyViewController, animated: true)
                    
                case .failure(let error):
                    self.loginView.resultLabel.text = error.errorMessage
                }
            }
        }
    }
}
