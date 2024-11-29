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
        setDelegates()
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
    
    // MARK: - Delegates
    private func setDelegates(){
        userUpdateInfoView.delegate = self
    }
}

// MARK: - Delegate extension
extension UserUpdateViewController: UserInfoUpdateViewDelegate {
    func updateButtonTapped(hobby: String?, password: String?) {
        let hobbyText = hobby ?? ""
        let passwordText = password ?? ""
        
        if !hobbyText.isEmpty && hobbyText.count > 8 || !passwordText.isEmpty && passwordText.count > 8 {
            userUpdateInfoView.resultLabel.text = "🚨 최대 8자까지 입력 가능합니다."
            return
        }
        
        if hobbyText.isEmpty && passwordText.isEmpty {
            userUpdateInfoView.resultLabel.text = "🥵 하나 이상 입력해주세요."
            return
        }
        
        userService.updateUserInfo(hobby: hobbyText, password: passwordText) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success:
                    self.userUpdateInfoView.resultLabel.text = "😇 성공적으로 변경되었습니다."
                case .failure(let error):
                    self.userUpdateInfoView.resultLabel.text = "😭 변경 실패했습니다.. : \(error.errorMessage)"
                }
            }
        }
    }
}
