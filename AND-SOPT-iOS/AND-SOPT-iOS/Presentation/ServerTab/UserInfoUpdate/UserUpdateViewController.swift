//
//  UserUpdateViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import UIKit

class UserUpdateViewController: UIViewController {
    private let contentView = UIView()
    private let userUpdateInfoView = UserInfoUpdateView()
    private let userService = UserService()
    
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
        view.addSubview(contentView)
        contentView.addSubviews(userUpdateInfoView)
    }
    
    private func setLayout(){
        contentView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        userUpdateInfoView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setActions() {
        userUpdateInfoView.updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: - Actions
    @objc private func updateButtonTapped() {
        let hobby = userUpdateInfoView.hobbyTextField.text ?? ""
        let password = userUpdateInfoView.passwordTextField.text ?? ""
        
        if !hobby.isEmpty && hobby.count > 8 || !password.isEmpty && password.count > 8 {
            userUpdateInfoView.resultLabel.text = "🚨 최대 8자까지 입력 가능합니다."
            return
        }
        
        if hobby.isEmpty && password.isEmpty {
            userUpdateInfoView.resultLabel.text = "🥵 하나 이상 입력해주세요."
            return
        }
        
        userService.updateUserInfo(hobby: hobby, password: password) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success:
                    self.userUpdateInfoView.resultLabel.text = "😇 성공적으로 변경되었습니다."
                case .failure(let error):
                    self.userUpdateInfoView.resultLabel.text = "😭 변경 실패했습니다.. :  \(error.errorMessage)"
                }
            }
        }
    }
}
