//
//  ViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "티니핑 맞추기"
        label.font = .systemFont(ofSize: 23)
        return label
    }()
    
    // ImageView 추가
    private let questionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let answerTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "정답을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("정답 확인하러 가기", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var pushModeToggleButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var pushMode = true
    
    private let progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.progress = 1.0
        return progress
    }()
    
    
    private let quizImg = "pogen.png"
    

    private let answer = "포근핑"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        loadQuestion()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        updateUI()
    }
    
    private func setUI() {
        [
            titleLabel,
            questionImageView,
            answerTextField,
            nextButton,
            pushModeToggleButton,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                questionImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                questionImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                questionImageView.widthAnchor.constraint(equalToConstant: 200),
                questionImageView.heightAnchor.constraint(equalToConstant: 200),
                
                answerTextField.topAnchor.constraint(
                    equalTo: questionImageView.bottomAnchor,
                    constant: 20
                ),
                answerTextField.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                answerTextField.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                answerTextField.heightAnchor.constraint(equalToConstant: 40),
                
                nextButton.topAnchor.constraint(
                    equalTo: answerTextField.bottomAnchor,
                    constant: 20
                ),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 44),
                nextButton.widthAnchor.constraint(equalToConstant: 300),
                
                pushModeToggleButton.topAnchor.constraint(
                    equalTo: nextButton.bottomAnchor,
                    constant: 20
                ),
                pushModeToggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pushModeToggleButton.heightAnchor.constraint(equalToConstant: 44),
                pushModeToggleButton.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }
    
    private func updateUI() {
        let mode  = pushMode ? "(네비게이션)" : "(모달)"
        self.titleLabel.text = "티니핑 맞추기 \(mode)"
    }
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        
        guard let userAnswer = answerTextField.text, !userAnswer.isEmpty else {
            return
        }
        
        nextViewController.dataBind(userAnswer: userAnswer, answer: answer)

        if pushMode {
            self.navigationController?.pushViewController(
                nextViewController,
                animated: true
            )
        } else {
            self.present(
                nextViewController,
                animated: true
            )
        }
    }
    
    @objc func toggleButtonTapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
    
    // 퀴즈이미지
    private func loadQuestion() {
        questionImageView.image = UIImage(named: quizImg)
        answerTextField.text = ""
    }
}
