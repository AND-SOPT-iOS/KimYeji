//
//  OtherHobbyView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/8/24.
//

import UIKit

protocol OtherHobbyViewDelegate: AnyObject {
    func fetchHobbyButtonTapped()
}

class OtherHobbyView: UIView {
    weak var delegate: OtherHobbyViewDelegate?
    
    // MARK: - Components
    private let otherHobbytitleLabel = UILabel().then {
        $0.text = "🥸 랜덤 사용자의 취미는?"
        $0.font = .systemFont(ofSize: 25, weight: .bold)
    }
    
    private let otherHobbyBoxView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.clipsToBounds = true
    }
    
    let otherHobbyLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 18)
        $0.textAlignment = .center
    }
    
    private lazy var fetchHobbyButton = UIButton().then {
        $0.setTitle("😎 랜덤 주인공 뽑기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemOrange
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(fetchHobbyButtonTapped), for: .touchUpInside)
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
        addSubviews(otherHobbytitleLabel, otherHobbyBoxView, fetchHobbyButton)
        otherHobbyBoxView.addSubview(otherHobbyLabel)
    }
    
    private func setLayout() {
        otherHobbytitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview()
        }
        
        otherHobbyBoxView.snp.makeConstraints {
            $0.top.equalTo(otherHobbytitleLabel.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        otherHobbyLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        fetchHobbyButton.snp.makeConstraints {
            $0.top.equalTo(otherHobbyBoxView.snp.bottom).offset(15)
            $0.height.equalTo(50)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    @objc private func fetchHobbyButtonTapped() {
        delegate?.fetchHobbyButtonTapped()
    }
}
