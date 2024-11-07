//
//  HobbyViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/7/24.
//

import UIKit

class HobbyViewController: UIViewController {
    private let myHobbyView = MyHobbyView()
    private let myHobbyService = MyHobbyService()
    
    
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
        view.addSubview(myHobbyView)
    }
    
    private func setLayout(){
        myHobbyView.snp.makeConstraints { $0.edges.equalToSuperview() }
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
