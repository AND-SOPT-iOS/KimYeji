//
//  HobbyViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/7/24.
//

import UIKit

class HobbyViewController: UIViewController {
    private let contentView = UIView()
    private let myHobbyView = MyHobbyView()
    private let myHobbyService = MyHobbyService()
    private let otherHobbyView = OtherHobbyView()
    private let otherHobbyService = OtherHobbyService()
    private let userUpdateGuideView = UserUpdateGuideView()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setActions()
        fetchMyHobby()
    }
    
    // MARK: - UI, Layout
    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(contentView)
        contentView.addSubviews(myHobbyView, otherHobbyView, userUpdateGuideView)
    }
    
    private func setLayout(){
        contentView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        myHobbyView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        otherHobbyView.snp.makeConstraints {
            $0.top.equalTo(myHobbyView.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
            
        }
        
        userUpdateGuideView.snp.makeConstraints{
            $0.top.equalTo(otherHobbyView.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-20)
        }
    }
    
    private func setActions() {
        otherHobbyView.fetchHobbyButton.addTarget(self, action: #selector(fetchOtherHobby), for: .touchUpInside)
        
        userUpdateGuideView.goToUserInfoUpdateButton.addTarget(self, action: #selector(goToUserInfoUpdateButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - API
    private func fetchMyHobby(){
        myHobbyService.fetchMyHobby { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let hobby):
                    self.myHobbyView.myHobbyLabel.text = hobby
                case .failure(let error):
                    self.myHobbyView.myHobbyLabel.text = error.errorMessage
                }
            }
        }
    }
    
    @objc private func fetchOtherHobby() {
        let randomUserNo = Int.random(in: 1...600)
        
        otherHobbyService.fetchOtherHobby(userNo: randomUserNo) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let hobby):
                    self.otherHobbyView.otherHobbyLabel.text = "\(randomUserNo)번 주인공의 취미는..  \(hobby)"
                case .failure(_):
                    self.otherHobbyView.otherHobbyLabel.text = "😭 해당 번호의 사용자를 찾을 수 없습니다."
                }
            }
        }
    }
    
    @objc private func goToUserInfoUpdateButtonTapped(){
        let userUpdateViewController  = UserUpdateViewController()
        navigationController?.pushViewController(userUpdateViewController, animated: true)
    }
    
}
