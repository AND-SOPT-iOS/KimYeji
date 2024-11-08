//
//  SignUpViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import UIKit
import SnapKit
import Then

class SignUpViewController: UIViewController {
    private let signUpView = SignUpView()
    let userService = UserService()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setDelegates()
    }
    
    // MARK: - Style, UI, Layout
    private func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUI() {
        view.addSubview(signUpView)
    }
    
    private func setLayout() {
        view.addSubview(signUpView)
        signUpView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    // MARK: - Delegates
    private func setDelegates() {
        signUpView.delegate = self
    }
}

// MARK: - Delegate extension
extension SignUpViewController: SignUpViewDelegate {
    func signUpButtonTapped(username: String?, password: String?, hobby: String?) {
        guard let username = username, !username.isEmpty,
              let password = password, !password.isEmpty,
              let hobby = hobby, !hobby.isEmpty else {
            signUpView.resultLabel.text = "🚨 모든 필드를 입력해주세요."
            return
        }
        
        guard username.count <= 8, password.count <= 8, hobby.count <= 8 else {
            signUpView.resultLabel.text = "😭 각 입력 필드는 8자 이하로 작성해주세요."
            return
        }
        
        userService.register(
            username: username,
            password: password,
            hobby: hobby
        ) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success:
                    self.signUpView.resultLabel.text = "😻 회원가입 되었습니다. 로그인 해주세요!"
                case let .failure(error):
                    self.signUpView.resultLabel.text = error.errorMessage
                }
            }
        }
    }
    
    func loginButtonTapped() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
