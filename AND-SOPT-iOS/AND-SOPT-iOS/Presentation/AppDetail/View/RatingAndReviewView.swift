//
//  RatingAndReviewView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/24/24.
//

import UIKit

protocol RatingAndReviewViewDelegate: AnyObject {
    func seeAllReviewsButtonTapped()
}

class RatingAndReviewView: UIView {
    // MARK: - Properties
    weak var delegate: RatingAndReviewViewDelegate?
    
    // MARK: - Components
    
    private let ratingAndReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "평가 및 리뷰"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private let seeAllReviewsButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold))
        button.setImage(icon, for: .normal)
        button.tintColor = .systemGray
        button.addTarget(nil, action: #selector(seeAllReviewsButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let ratingScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = .systemFont(ofSize: 60, weight: .black)
        label.textColor = .label
        
        return label
    }()
    
    private let reviewStarLabel : UILabel = {
        let label = UILabel()
        label.text = "★ ★ ★ ★ ☆"
        label.font = .systemFont(ofSize: 23, weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    private let reviewCountsLabel: UILabel = {
        let label = UILabel()
        label.text = "8.4만개의 평가"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let mostHelpfulLabel: UILabel = {
        let label = UILabel()
        label.text = "가장 도움이 되는 리뷰"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    // 리뷰
    private let tapToRateLabel: UILabel = {
        let label = UILabel()
        label.text = "탭하여 평가하기"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        
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
    private lazy var reviewCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // 리뷰작성, 앱 지원
    private let reviewWriteButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "square.and.pencil")
        config.title = "리뷰 작성"
        config.baseForegroundColor = .systemBlue
        config.imagePadding = 5
        config.background.backgroundColor = .tertiarySystemGroupedBackground
        config.background.cornerRadius = 10
        button.configuration = config
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        
        return button
    }()
    
    private let appSupportButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "questionmark.circle")
        config.title = "앱 지원"
        config.baseForegroundColor = .systemBlue
        config.imagePadding = 5
        config.background.backgroundColor = .tertiarySystemGroupedBackground
        config.background.cornerRadius = 10
        button.configuration = config
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        
        return button
    }()
    
    // MARK: - Data
    private let reviews = Review.sampleReviews
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI, Layout
    private func setUI() {
        addSubviews(
            ratingAndReviewLabel,
            seeAllReviewsButton,
            ratingScoreLabel,
            reviewStarLabel,
            mostHelpfulLabel,
            reviewCountsLabel,
            tapToRateLabel,
            rateStarStackView,
            reviewCollectionView,
            reviewWriteButton,
            appSupportButton
        )
        
        for _ in 1...5 {
            let starButton = createReviewStarsButton()
            rateStarStackView.addArrangedSubview(starButton)
        }
    }
    
    private func setLayout() {
        ratingAndReviewLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        seeAllReviewsButton.snp.makeConstraints {
            $0.centerY.equalTo(ratingAndReviewLabel.snp.centerY)
            $0.leading.equalTo(ratingAndReviewLabel.snp.trailing).offset(8)
        }
        
        ratingScoreLabel.snp.makeConstraints {
            $0.top.equalTo(ratingAndReviewLabel.snp.bottom)
            $0.leading.equalToSuperview()
        }
        
        reviewStarLabel.snp.makeConstraints {
            $0.top.equalTo(seeAllReviewsButton.snp.bottom).offset(5)
            $0.trailing.equalToSuperview()
        }
        
        reviewCountsLabel.snp.makeConstraints {
            $0.top.equalTo(reviewStarLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview()
        }
        
        mostHelpfulLabel.snp.makeConstraints {
            $0.top.equalTo(ratingScoreLabel.snp.bottom).offset(25)
            $0.leading.equalToSuperview()
        }
        
        reviewCollectionView.snp.makeConstraints {
            $0.top.equalTo(mostHelpfulLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        tapToRateLabel.snp.makeConstraints {
            $0.top.equalTo(reviewCollectionView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        rateStarStackView.snp.makeConstraints {
            $0.top.equalTo(tapToRateLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        
        reviewWriteButton.snp.makeConstraints {
            $0.top.equalTo(rateStarStackView.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(appSupportButton.snp.leading).offset(-10)
        }
        
        appSupportButton.snp.makeConstraints {
            $0.top.equalTo(reviewWriteButton.snp.top)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(reviewWriteButton)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    private func setCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 60, height: 200)
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        
        reviewCollectionView.do{
            $0.setCollectionViewLayout(flowLayout, animated: true)
            $0.register(ReviewCell.self,
                        forCellWithReuseIdentifier: ReviewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    // 별 버튼 5개 생성 (탭하여 평가하기 UI)
    private func createReviewStarsButton() -> UIButton {
        let button = UIButton()
        let starImage = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))
        button.setImage(starImage, for: .normal)
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }
    
    // MARK: - Actions
    @objc private func seeAllReviewsButtonTapped() {
        delegate?.seeAllReviewsButtonTapped()
    }
}

// MARK: - DataSource, Delegate
extension RatingAndReviewView: UICollectionViewDelegate { }

extension RatingAndReviewView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.identifier, for: indexPath) as? ReviewCell else {
            return UICollectionViewCell()
        }
        
        item.bind(reviews[indexPath.item])
        return item
    }
}

