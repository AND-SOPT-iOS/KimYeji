//
//  MyHobbyView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import UIKit

class MyHobbyView: UIView {
    // MARK: - UI Components
    private let myHobbyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "🤩 나의 취미는?"
        label.font = .systemFont(ofSize: .init(25), weight: .bold)
        return label
    }()
    
    private let myHobbyBoxView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray4.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    let myHobbyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
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
