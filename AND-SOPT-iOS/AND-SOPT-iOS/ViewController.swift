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
        label.text = "티니핑 맞추기 "
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
    
    private let answerLabelField: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .blue
        return label
    }()
    
    private lazy var checkAnswerButton: UIButton = {
        let button = UIButton()
        button.setTitle("정답 확인", for: .normal)
        button.backgroundColor = .brown
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(checkAnswerTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음 문제", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // isHidden 속성
    private lazy var pushModeToggleButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let quizImgs = ["waffle.png", "donut.png", "pipo.png", "pogen.png"]
    private let answers = ["와플핑", "또너핑", "삐뽀핑", "포근핑"]
    
    private var pushMode = true
    private var idx = 0
    private var cnt = 0
    
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
            answerLabelField,
            nextButton,
            checkAnswerButton,
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
                
                answerLabelField.topAnchor.constraint(equalTo: answerTextField.bottomAnchor, constant: 20),
                answerLabelField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                checkAnswerButton.topAnchor.constraint(equalTo: answerLabelField.bottomAnchor, constant: 20),
                checkAnswerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                checkAnswerButton.heightAnchor.constraint(equalToConstant: 44),
                checkAnswerButton.widthAnchor.constraint(equalToConstant: 300),
                
                nextButton.topAnchor.constraint(equalTo: checkAnswerButton.bottomAnchor, constant: 20),
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
        self.titleLabel.text = "티니핑 맞추기 " + mode
    }
    
    private func loadQuestion() {
        let imgFile = quizImgs[idx]
        questionImageView.image = UIImage(named: imgFile)
        answerTextField.text = ""
        answerLabelField.text = ""
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        nextViewController.dataBind(
            cnt: cnt
        )
        
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
    
    @objc func nextButtonTapped() {
        if idx < quizImgs.count - 1 {
            idx += 1
            loadQuestion()
        } else {
            transitionToNextViewController()
        }
    }
    
    @objc func checkAnswerTapped() {
        guard let userAnswer = answerTextField.text else {
            return
        }
        
        if userAnswer == answers[idx]{
            answerLabelField.textColor = .blue
            answerLabelField.text = "정답입니다!!!!!!!!!!!!"
            cnt += 1
        } else {
            answerLabelField.textColor = .red
            answerLabelField.text = "오답입니다.. 정답은....... " + answers[idx]
        }
        
        if idx ==  quizImgs.count - 1 {
            nextButton.setTitle(
                "정답 개수 확인하러 가기",
                for: .normal
            )
            nextButton.backgroundColor = .red
            pushModeToggleButton.isHidden = false
        }
    }
}
