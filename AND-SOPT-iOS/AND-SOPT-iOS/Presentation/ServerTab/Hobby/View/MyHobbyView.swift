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

    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        addSubviews(myHobbyTitleLabel)
    }
    
    private func setupLayout() {
        myHobbyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
