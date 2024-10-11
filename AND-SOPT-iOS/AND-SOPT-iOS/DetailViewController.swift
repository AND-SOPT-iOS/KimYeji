//
//  DetailViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/10/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let answerCntLabel: UILabel = {
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
        [answerCntLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                answerCntLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 50
                ),
                answerCntLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                backButton.topAnchor.constraint(
                    equalTo: answerCntLabel.bottomAnchor,
                    constant: 20
                ),
                backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backButton.heightAnchor.constraint(equalToConstant: 44),
                backButton.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }
    
    func updateUI() {
        answerCntLabel.text = "정답 개수 : \(receivedCount ?? 0)"
    }
    
    func dataBind(cnt: Int) {
        self.receivedCount = cnt
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
