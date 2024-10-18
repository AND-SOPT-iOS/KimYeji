//
//  AnswerCountViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/10/24.
//

import UIKit

class AnswerCountViewController: UIViewController {
    
    private let answerCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var receivedCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .lightGray
    }
    
    private func setUI() {
        view.addSubviews(answerCountLabel, backButton)
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                answerCountLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 50
                ),
                answerCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                backButton.topAnchor.constraint(
                    equalTo: answerCountLabel.bottomAnchor,
                    constant: 20
                ),
                backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backButton.heightAnchor.constraint(equalToConstant: 44),
                backButton.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }
    
    func updateUI() {
        answerCountLabel.text = "정답 개수 : \(receivedCount ?? 0)"
    }
    
    func dataBind(count: Int) {
        self.receivedCount = count
        updateUI()
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
