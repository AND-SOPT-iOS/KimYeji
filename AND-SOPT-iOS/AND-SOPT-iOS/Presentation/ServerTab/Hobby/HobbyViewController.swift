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
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        fetchMyHobby()
    }
    
    // MARK: - UI, Layout
    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(contentView)
        contentView.addSubviews(myHobbyView, otherHobbyView)
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
            $0.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-20)
        }
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
}
