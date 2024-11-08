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
}
