//
//  HobbyViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/7/24.
//

import UIKit

class HobbyViewController: UIViewController {
    private let myHobbyView = MyHobbyView()

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    // MARK: - UI, Layout
    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(myHobbyView)
    }
    
    private func setLayout(){
        myHobbyView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
