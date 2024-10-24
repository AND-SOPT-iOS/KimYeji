//
//  RatingAndReviewView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/24/24.
//

import UIKit

class RatingAndReviewView: UIView {
    // MARK: 평가 및 리뷰
    private let ratingAndReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "평가 및 리뷰"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private let seeAllReviewsButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
//        button.addTarget(nil, action: #selector(seeAllReviewsButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let ratingScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = .systemFont(ofSize: 55, weight: .black)
        label.textColor = .white
        
        return label
    }()
    
    private let maxRatingLabel: UILabel = {
        let label = UILabel()
        label.text = "5점 만점"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
        
        return label
    }()
    
    private let reviewCountsLabel: UILabel = {
        let label = UILabel()
        label.text = "8.4만개의 평가"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
        
        return label
    }()
    
    private let separateLine6: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // 리뷰
    private let tapToRateLabel: UILabel = {
        let label = UILabel()
        label.text = "탭하여 평가하기 : "
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        
        return label
    }()
    
    private let rateStarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }();
    
    // 리뷰 내용
    private let reviewBackgroundGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let reviewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "김예지(리뷰제목)"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let reviewDateLabel: UILabel = {
        let label = UILabel()
        label.text = "10월 21일"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .lightGray
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "ENFJ"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .lightGray
        return label
    }()
    
    private let reviewStarScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "★★★★★"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .orange
        return label
    }()
    
    private let reviewContentLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 업데이트가 토스 만의 ux 색깔 개성 자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데이트로 인해 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 3
        return label
    }()
    
    private let readMoreReviewContentButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.backgroundColor = .darkGray
        
        return button
    }()
    
    private let developerResponseTextLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자 답변"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let developerResponseContentLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자의 남산위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리기상 일세 무궁화 삼천리 화려강산 대한사람 대한으로 길이보전하세"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 2
        
        return label
    }()
    
    private let readMoredeveloperResponseButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.backgroundColor = .darkGray
        
        return button
    }()
    
    private let developerResponseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "10월 22일"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .lightGray
        
        return label
    }()
    
    // 리뷰작성, 앱 지원
    private let reviewWriteButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "square.and.pencil")
        config.title = "리뷰 작성"
        config.baseForegroundColor = .systemBlue
        config.imagePadding = 5
        button.configuration = config
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        
        return button
    }()
    
    private let appSupportButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "questionmark.circle")
        config.title = "앱 지원"
        config.baseForegroundColor = .systemBlue
        config.imagePadding = 5
        button.configuration = config
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle(){
        self.backgroundColor = .black
    }
    
    private func setUI() {
        addSubviews(
            ratingAndReviewLabel, seeAllReviewsButton, ratingScoreLabel, maxRatingLabel,
            reviewCountsLabel, separateLine6, tapToRateLabel, rateStarStackView, reviewBackgroundGrayView,
            reviewTitleLabel, reviewDateLabel, reviewStarScoreLabel, userNameLabel, reviewContentLabel,
            readMoreReviewContentButton, developerResponseTextLabel, developerResponseDateLabel,
            developerResponseContentLabel, readMoredeveloperResponseButton, reviewWriteButton, appSupportButton
        )
        
        
        for _ in 1...5 {
            let starButton = createReviewStarsButton()
            rateStarStackView.addArrangedSubview(starButton)
        }
    }
    private func setLayout() {
        ratingAndReviewLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        seeAllReviewsButton.snp.makeConstraints {
            $0.centerY.equalTo(ratingAndReviewLabel.snp.centerY)
            $0.trailing.equalToSuperview()
        }
        
        ratingScoreLabel.snp.makeConstraints {
            $0.top.equalTo(ratingAndReviewLabel.snp.bottom)
            $0.leading.equalToSuperview()
        }
        
        maxRatingLabel.snp.makeConstraints {
            $0.top.equalTo(ratingScoreLabel.snp.bottom)
            $0.centerX.equalTo(ratingScoreLabel.snp.centerX)
        }
        
        reviewCountsLabel.snp.makeConstraints {
            $0.centerY.equalTo(ratingScoreLabel.snp.centerY)
            $0.trailing.equalToSuperview()
        }
        
        separateLine6.snp.makeConstraints {
            $0.top.equalTo(maxRatingLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0.4)
        }
        
        tapToRateLabel.snp.makeConstraints {
            $0.top.equalTo(separateLine6.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        rateStarStackView.snp.makeConstraints {
            $0.centerY.equalTo(tapToRateLabel.snp.centerY)
            $0.leading.equalTo(tapToRateLabel.snp.trailing).offset(10)
            $0.trailing.lessThanOrEqualToSuperview().inset(20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        
        reviewBackgroundGrayView.snp.makeConstraints {
            $0.top.equalTo(tapToRateLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(200)
            $0.leading.trailing.equalToSuperview()
        }
        
        reviewTitleLabel.snp.makeConstraints {
            $0.top.equalTo(reviewBackgroundGrayView).offset(15)
            $0.leading.equalTo(reviewBackgroundGrayView).offset(15)
        }
        
        reviewDateLabel.snp.makeConstraints {
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
            $0.centerY.equalTo(reviewTitleLabel.snp.centerY)
        }
        
        reviewStarScoreLabel.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(3)
            $0.leading.equalTo(reviewTitleLabel.snp.leading)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
            $0.centerY.equalTo(reviewStarScoreLabel.snp.centerY)
        }
        
        reviewContentLabel.snp.makeConstraints {
            $0.top.equalTo(reviewStarScoreLabel.snp.bottom).offset(10)
            $0.leading.equalTo(reviewStarScoreLabel.snp.leading)
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
        }
        
        readMoreReviewContentButton.snp.makeConstraints {
            $0.centerY.equalTo(reviewContentLabel.snp.centerY).offset(17)
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
        }
        
        developerResponseTextLabel.snp.makeConstraints {
            $0.top.equalTo(reviewContentLabel.snp.bottom).offset(13)
            $0.leading.equalTo(reviewContentLabel.snp.leading)
        }
        
        developerResponseDateLabel.snp.makeConstraints {
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
            $0.centerY.equalTo(developerResponseTextLabel.snp.centerY)
        }
        
        developerResponseContentLabel.snp.makeConstraints {
            $0.top.equalTo(developerResponseTextLabel.snp.bottom).offset(5)
            $0.leading.equalTo(developerResponseTextLabel.snp.leading)
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
        }
        
        readMoredeveloperResponseButton.snp.makeConstraints {
            $0.centerY.equalTo(developerResponseContentLabel.snp.centerY).offset(7)
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
        }
        
        reviewWriteButton.snp.makeConstraints {
            $0.top.equalTo(reviewBackgroundGrayView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(-10)
        }
        
        appSupportButton.snp.makeConstraints {
            $0.centerY.equalTo(reviewWriteButton.snp.centerY)
            $0.trailing.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview()
        }
    }
    
//    @objc private func seeAllReviewsButtonTapped(){
//        let allReviewsViewController = AllReviewsViewController()
//        self.navigationController?.pushViewController(allReviewsViewController, animated: true)
//    }
    
    // 별 버튼 5개 생성 (탭하여 평가하기)
    private func createReviewStarsButton() -> UIButton {
        let button = UIButton()
        let starImage = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))
        button.setImage(starImage, for: .normal)
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }
}
