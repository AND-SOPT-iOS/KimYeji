//
//  MyHobbyView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import UIKit

class MyHobbyView: UIView {
    // MARK: - Components
    private let myHobbyTitleLabel = UILabel().then {
        $0.text = "🤩 나의 취미는?"
        $0.font = .systemFont(ofSize: 25, weight: .bold)
    }
    
    private let myHobbyBoxView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.clipsToBounds = true
    }
    
    let myHobbyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.textAlignment = .center
    }
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI, Layout
    private func setUI() {
        addSubviews(myHobbyTitleLabel, myHobbyBoxView)
        myHobbyBoxView.addSubview(myHobbyLabel)
    }
    
    private func setLayout() {
        myHobbyTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview()
        }
        
        myHobbyBoxView.snp.makeConstraints {
            $0.top.equalTo(myHobbyTitleLabel.snp.bottom).offset(20)
            $0.height.equalTo(100)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        myHobbyLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
    }
}
