//
//  AppStoreTossMainViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/18/24.
//

import UIKit
import SnapKit

class AppStoreTossMainViewController: UIViewController {
    private let navigationBar = UINavigationBar()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // MARK: 첫번째 섹션 (앱 이름, 아이콘, 열기 버튼, 공유 버튼)
    private let appImageImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "toss.png")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        return image
    }()
    
    private let appTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "토스"
        label.font = .systemFont(ofSize: 23 , weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "금융이 쉬워진다"
        label.font = .systemFont(ofSize: 17 , weight: .medium)
        label.textColor = .systemGray
        return label
    }()
    
    private let openButton: UIButton = {
        let button = UIButton()
        button.setTitle("열기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 17
        button.layer.masksToBounds = true
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        let shareIcon = UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(shareIcon, for: .normal)
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let separateLine1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: 두번째 섹션 (평가 개수, 수상, 연령)
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        //        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    // 평가
    private let rateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    private let rateCountLabel: UILabel = {
        let label = UILabel()
        label.text = "8.4만개의 평가"
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let rateTextLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = .systemFont(ofSize: 18, weight: .black)
        label.textColor = .systemGray
        return label
    }()
    
    private let rateStarLabel: UILabel = {
        let label = UILabel()
        label.text = "★★★★☆"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let verticalLine1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    // 수상
    private let awardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    private let awardLabel: UILabel = {
        let label = UILabel()
        label.text = "수상"
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let awardTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "에디터의\n선택"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let awardCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "앱"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let verticalLine2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    // 연령
    private let ageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    private let ageTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "연령"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let ageTextLabel: UILabel = {
        let label = UILabel()
        label.text = "4+"
        label.font = .systemFont(ofSize: 20, weight: .black)
        label.textColor = .systemGray
        return label
    }()
    
    private let ageUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "세"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let separateLine2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: 세번째 섹션(새로운 소식)
    private let newNewsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let versionTextLabel: UILabel = {
        let label = UILabel()
        label.text = "버전 5.185.0"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let versionUpdateDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2일 전"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemGray
        return label
    }()
    
    private let versionUpdateRecordButton: UIButton = {
        let button = UIButton()
        button.setTitle("버전 기록", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(nil, action: #selector(versionUpdateRecordButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let versionUpdateDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다.  365일 24시간 언제든지요."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let separateLine3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: 네번째 섹션(미리 보기 이미지)
    private let previewImageLabel: UILabel = {
        let label = UILabel()
        label.text = "미리 보기"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "preview.png")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let deviceImageView: UIImageView = {
        let imageView = UIImageView()
        let deviceIcon = UIImage(systemName: "iphone", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        imageView.image = deviceIcon
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        
        return imageView
    }()
    
    private let deviceLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .lightGray
        return label
    }()
    
    private let separateLine4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: 다섯번째 섹션(앱 상세 정보, 개발자 정보)
    private let appInstallLabel: UILabel = {
        let label = UILabel()
        label.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가\n필요합니다."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        
        return label
    }()
    
    
    private let appInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "● 내 금융 현황을 한눈에, 홈·소비"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private let appInfoMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.addTarget(nil, action: #selector(appInfoMoreButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let devloperInfoTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Viva Republica", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return button
    }()
    
    private let developerAppMoreButton: UIButton = {
        let button = UIButton()
        let shareIcon = UIImage(systemName: "chevron.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(shareIcon, for: .normal)
        button.tintColor = .lightGray
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let developerTextLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .lightGray
        
        return label
    }()
    
    private let separateLine5: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // MARK: 여섯번째 섹션 (평가 및 리뷰, 리뷰 내용) - 마지막
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
        button.addTarget(nil, action: #selector(seeAllReviewsButtonTapped), for: .touchUpInside)
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationStyle()
        setStyle()
        setUI()
        setLayout()
    }
    
    
    private func setStyle() {
        self.view.backgroundColor = .black
    }
    
    private func setUI(){
        view.addSubview(navigationBar)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        for _ in 1...5 {
            let starButton = createReviewStarsButton()
            rateStarStackView.addArrangedSubview(starButton)
        }
        
        [
            appImageImageView,
            appTitleLabel,
            appDescriptionLabel,
            openButton,
            shareButton,
            separateLine1,
            
            infoStackView,
            separateLine2,
            
            newNewsTitleLabel,
            versionTextLabel,
            versionUpdateDateLabel,
            versionUpdateDescriptionLabel,
            versionUpdateRecordButton,
            separateLine3,
            
            previewImageLabel,
            previewImageView,
            deviceImageView,
            deviceLabel,
            separateLine4,
            
            appInstallLabel,
            appInfoLabel,
            appInfoMoreButton,
            developerTextLabel,
            devloperInfoTextButton,
            developerAppMoreButton,
            separateLine5,
            
            ratingAndReviewLabel,
            ratingScoreLabel,
            maxRatingLabel,
            seeAllReviewsButton,
            reviewCountsLabel,
            separateLine6,
            
            tapToRateLabel,
            rateStarStackView,
            
            reviewBackgroundGrayView,
            reviewTitleLabel,
            reviewDateLabel,
            reviewStarScoreLabel,
            userNameLabel,
            reviewContentLabel,
            readMoreReviewContentButton,
            
            developerResponseTextLabel,
            developerResponseDateLabel,
            developerResponseContentLabel,
            readMoredeveloperResponseButton,
            
            reviewWriteButton,
            appSupportButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        rateStackView.addArrangedSubviews(rateCountLabel, rateTextLabel, rateStarLabel)
        awardStackView.addArrangedSubviews(awardLabel, awardTitleLabel, awardCategoryLabel)
        ageStackView.addArrangedSubviews(ageTitleLabel, ageTextLabel, ageUnitLabel)
        infoStackView.addArrangedSubviews(rateStackView, verticalLine1, awardStackView, verticalLine2, ageStackView)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.greaterThanOrEqualTo(scrollView.snp.height).offset(1)
            //            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        // MARK: 첫번째 섹션
        appImageImageView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(120)
        }
        
        appTitleLabel.snp.makeConstraints {
            $0.top.equalTo(appImageImageView.snp.top)
            $0.leading.equalTo(appImageImageView.snp.trailing).offset(20)
            $0.trailing.equalTo(contentView).inset(20)
        }
        
        appDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(appTitleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(appTitleLabel.snp.leading)
            $0.trailing.equalTo(contentView).inset(20)
        }
        
        openButton.snp.makeConstraints {
            $0.top.equalTo(appDescriptionLabel.snp.bottom).offset(30)
            $0.leading.equalTo(appTitleLabel.snp.leading)
            $0.width.equalTo(75)
            $0.height.equalTo(35)
        }
        
        shareButton.snp.makeConstraints {
            $0.centerY.equalTo(openButton.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(30)
        }
        
        separateLine1.snp.makeConstraints {
            $0.top.equalTo(openButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 두번째 섹션
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(separateLine1.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        verticalLine1.snp.makeConstraints {
            $0.width.equalTo(0.3)
        }
        
        verticalLine2.snp.makeConstraints {
            $0.width.equalTo(0.3)
        }
        
        separateLine2.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 세번째 섹션
        newNewsTitleLabel.snp.makeConstraints {
            $0.top.equalTo(separateLine2.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        
        versionUpdateRecordButton.snp.makeConstraints{
            $0.centerY.equalTo(newNewsTitleLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        versionTextLabel.snp.makeConstraints{
            $0.top.equalTo(newNewsTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(20)
        }
        
        versionUpdateDateLabel.snp.makeConstraints{
            $0.centerY.equalTo(versionTextLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        versionUpdateDescriptionLabel.snp.makeConstraints{
            $0.top.equalTo(versionTextLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        separateLine3.snp.makeConstraints{
            $0.top.equalTo(versionUpdateDescriptionLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 네번째 섹션
        previewImageLabel.snp.makeConstraints{
            $0.top.equalTo(separateLine3.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        
        previewImageView.snp.makeConstraints {
            $0.top.equalTo(previewImageLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(600)
        }
        
        deviceImageView.snp.makeConstraints{
            $0.top.equalTo(previewImageView.snp.bottom).offset(10)
            $0.leading.equalTo(previewImageLabel.snp.leading)
        }
        
        deviceLabel.snp.makeConstraints{
            $0.centerY.equalTo(deviceImageView.snp.centerY)
            $0.leading.equalTo(deviceImageView.snp.trailing).offset(5)
        }
        
        separateLine4.snp.makeConstraints{
            $0.top.equalTo(deviceLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 다섯번째 섹션
        appInstallLabel.snp.makeConstraints{
            $0.top.equalTo(separateLine4.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        appInfoLabel.snp.makeConstraints{
            $0.top.equalTo(appInstallLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        appInfoMoreButton.snp.makeConstraints{
            $0.centerY.equalTo(appInfoLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        devloperInfoTextButton.snp.makeConstraints {
            $0.top.equalTo(appInfoLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        developerTextLabel.snp.makeConstraints {
            $0.top.equalTo(devloperInfoTextButton.snp.bottom).offset(-5)
            $0.leading.equalTo(devloperInfoTextButton.snp.leading)
        }
        
        developerAppMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(devloperInfoTextButton.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        separateLine5.snp.makeConstraints {
            $0.top.equalTo(developerTextLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 여섯번째 섹션 (평가 및 리뷰 탭)
        ratingAndReviewLabel.snp.makeConstraints {
            $0.top.equalTo(separateLine5.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        
        seeAllReviewsButton.snp.makeConstraints{
            $0.centerY.equalTo(ratingAndReviewLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        ratingScoreLabel.snp.makeConstraints {
            $0.top.equalTo(ratingAndReviewLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(20)
        }
        
        maxRatingLabel.snp.makeConstraints {
            $0.top.equalTo(ratingScoreLabel.snp.bottom)
            $0.centerX.equalTo(ratingScoreLabel.snp.centerX)
        }
        
        reviewCountsLabel.snp.makeConstraints{
            $0.centerY.equalTo(ratingScoreLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        separateLine6.snp.makeConstraints {
            $0.top.equalTo(maxRatingLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.4)
        }
        
        // 리뷰 부분
        tapToRateLabel.snp.makeConstraints {
            $0.top.equalTo(separateLine6.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        rateStarStackView.snp.makeConstraints {
            $0.centerY.equalTo(tapToRateLabel.snp.centerY)
            $0.leading.equalTo(tapToRateLabel.snp.trailing).offset(10)
            $0.trailing.lessThanOrEqualToSuperview().inset(20)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        
        // 리뷰
        reviewBackgroundGrayView.snp.makeConstraints{
            $0.top.equalTo(tapToRateLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(200)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        reviewTitleLabel.snp.makeConstraints{
            $0.top.equalTo(reviewBackgroundGrayView).offset(15)
            $0.leading.equalTo(reviewBackgroundGrayView).offset(15)
        }
        
        reviewDateLabel.snp.makeConstraints{
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
            $0.centerY.equalTo(reviewTitleLabel.snp.centerY)
        }
        
        reviewStarScoreLabel.snp.makeConstraints{
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(3)
            $0.leading.equalTo(reviewTitleLabel.snp.leading)
        }
        
        userNameLabel.snp.makeConstraints{
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
            $0.centerY.equalTo(reviewStarScoreLabel.snp.centerY)
        }
        
        reviewContentLabel.snp.makeConstraints{
            $0.top.equalTo(reviewStarScoreLabel.snp.bottom).offset(10)
            $0.leading.equalTo(reviewStarScoreLabel.snp.leading)
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
        }
        
        readMoreReviewContentButton.snp.makeConstraints{
            $0.centerY.equalTo(reviewContentLabel.snp.centerY).offset(17)
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
        }
        
        
        developerResponseTextLabel.snp.makeConstraints{
            $0.top.equalTo(reviewContentLabel.snp.bottom).offset(13)
            $0.leading.equalTo(reviewContentLabel.snp.leading)
        }
        
        developerResponseDateLabel.snp.makeConstraints{
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
            $0.centerY.equalTo(developerResponseTextLabel.snp.centerY)
        }
        
        developerResponseContentLabel.snp.makeConstraints{
            $0.top.equalTo(developerResponseTextLabel.snp.bottom).offset(5)
            $0.leading.equalTo(developerResponseTextLabel.snp.leading)
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
        }
        
        readMoredeveloperResponseButton.snp.makeConstraints{
            $0.centerY.equalTo(developerResponseContentLabel.snp.centerY).offset(7)
            $0.trailing.equalTo(reviewBackgroundGrayView).inset(15)
        }
        
        
        reviewWriteButton.snp.makeConstraints{
            $0.top.equalTo(reviewBackgroundGrayView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(5)
        }
        
        appSupportButton.snp.makeConstraints{
            $0.centerY.equalTo(reviewWriteButton.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    private func setNavigationStyle() {
        self.navigationController?.navigationBar.tintColor = .systemBlue
        self.navigationController?.navigationBar.barTintColor = .black
        
        self.title = "앱"
        
        let backImage = UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
    }
    
    // 별 버튼 5개 생성 (탭하여 평가하기)
    private func createReviewStarsButton() -> UIButton {
        let button = UIButton()
        let starImage = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))
        button.setImage(starImage, for: .normal)
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }
    
    @objc private func versionUpdateRecordButtonTapped(){
        let versionRecordViewController = VersionRecordViewController()
        self.navigationController?.pushViewController(versionRecordViewController, animated: true)
    }
    
    @objc private func seeAllReviewsButtonTapped(){
        let allReviewsViewController = AllReviewsViewController()
        self.navigationController?.pushViewController(allReviewsViewController, animated: true)
    }
    
    @objc private func appInfoMoreButtonTapped(){
        appInfoLabel.text = """
    ● 내 금융 현황을 한눈에, 홈·소비
    
    · 모든 계좌의 모든 정보를 한 곳에서, 따로 보았던 예적금, 청약, 증권, 대출 계좌의 정보를 한 곳에서 확인할 수 있어요.
    
    · 얼마나 벌고 얼마나 썼을까? 한 달 동안의 수입과 소비를 시간순으로 모아볼 수 있고, 소비 분석 리포트도 제공해드려요.
    
    · 카드 실적 헷갈릴 필요 없이, 실적을 충족한 카드가 무엇인지 얼마나 더 써야 실적을 달성하는지 한눈에 확인할 수 있어요.
    
    · 매달 고정적으로 나가는 보험비, 생활요금, 구독료 등도 쉽게 확인할 수 있어요.
    
    
    ● 평생 무료로 간편하고 안전하게, 송금
    
    · 송금을 자유롭게, 토스에서는 은행 상관없이 수수료가 평생 무료에요.
    
    · 송금을 안전하게, 송금 전 사기계좌를 미리 조회해 안전하게 송금할 수 있어요.
    
    · 송금을 간편하게, 단 한 번의 터치까지 줄였어요. 최소한의 터치로 송금하세요.
    
    · 그리고 마음까지, 간단한 메시지와 이모티콘을 함께 보내보세요.
    
    
    ● 지점에 가지 않아도 OK, 개설
    
    · 시간과 장소에 상관없이, 카드, 예·적금, 대출, 보험 등 다양한 금융상품을 개설할 수 있습니다.
    
    · 특별한 혜택은 덤으로, 토스에서만 드리는 혜택 또한 놓치지 마세요.
    
    
    ● 보험 관리를 한눈에, 보험
    
    · 가입한 보험과 월 보험료를 한눈에 확인하세요.
    
    · 또래에 비해 부족한 것은 없을까? 현재 가입한 보험의 보장을 참고해 부족한 보장을 추천해드립니다.
    
    · 전문가와 상담을 통해 내게 딱 맞는 보험을 추천 받고, 병원비도 간편하게 청구해 돌려받을 수 있어요.
    
    
    ● 누구나 받을 수 있는, 혜택
    
    · 좋아하는 브랜드를 더 사랑할 수 있도록, 1주일에 한 번씩 브랜드를 고르고 캐시백을 받아보세요.
    
    · 이번 주 미션을 달성하고 포인트를 받아보세요.
    
    · 걸음 수를 채우고 건강과 혜택을 한 번에, 만보기도 한번 사용해보세요.
    
    
    ● 쓸수록 커지는 혜택, 토스신용카드
    
    · 실적에 따라 더 큰 금액을 돌려드려요.
    
    · 결제 및 캐시백 내역을 토스 앱에서 확인할 수 있어요.
    
    · VISA 플래티늄 서비스 혜택 또한 누려보세요.
    
    
    ● 투자를 모두에게, 토스증권
    
    · 투자의 시작은 관심에서부터, 투자 판단에 도움을 주는 뉴스와 컨텐츠를 확인해보세요.
    
    · 송금처럼 쉬운 구매 경험, 이해하기 쉬운 용어로 나만의 주식 투자를 시작할 수 있어요.
    
    
    ● 완전히 새로운 은행, 토스뱅크
    
    · 채우고, 비우고, 자유롭게, 조건 없는 강력한 통장을 만나보세요.
    
    · 단 한 번의 조회로 가능, 어렵고 복잡한 과정 없는 대출이 기다리고 있어요.
    
    · 다채로운 컬러 그리고 아낌없이 주는 혜택, 토스뱅크 체크카드도 발급받아보세요.
    
    
    ● 가장 가까운 주민센터, 토스 주민센터
    
    · 정부24와 주민센터에서 발급 받았던 민원 증명서, 토스에서 빠르게 받고 낼 수 있어요.
    
    · 건강검진 일정 및 국가장학금 신청 안내, 교통범칙금·과태료 알림도 바로 받고 납부할 수 있어요.
    
    
    ● 사업을 하는 사장님도 편리하게, 내 매출 장부
    
    · 언제 얼마가 입금될까? 매일 알려드리고 매출, 입금 장부를 자동으로 써드려요.
    
    · 사장님 대상 지원 정책도 토스가 챙겨드릴게요.
    
    
    ● 안심하고 쓰세요
    
    · 대한민국 국민 3명 중 1명 사용, 누적 송금액 177조 원, 누적 다운로드 6,900만, 보안사고 0건 (2021년 8월 기준)
    
    · '2018 정보보호대상' 대상 수상 (과학기술정보통신부 주최)
    
    · 해킹 방어수준 25개 금융 앱 중 종합 1위 기록 (2017년 스틸리언 분석)
    
    · 카드사 수준 글로벌 데이터 보안 표준 'PCI-DSS' 업계 최초로 획득
    
    · 국제표준 정보보호 인증 ISO/IEC 27001 및 ISO/IEC 27701 취득
    
    · 24시간 관제 시스템과 이상금융거래탐지시스템으로 각종 위험을 예방
    
    
    ● 토스는 누가 운영하나요?
    
    토스는 핀테크 기업 '비바리퍼블리카'에서 운영합니다.
    
    비바리퍼블리카는 2019년 KPMG와 H2벤처스가 선정한 전 세계 100대 핀테크 기업 중 29위에 선정되었으며, 국내 핀테크 기업 중 가장 많은 은행 및 증권사와 공식 제휴를 맺고 있습니다. 또한 전자금융거래법 제28조에 따라, 보안과 관제 시스템에 대한 금융감독원의 실사 및 금융위원회의 승인을 통해 전자금융업으로 등록, 안전하게 서비스를 제공하고 있습니다.
    
    
    ● 꼭 필요한 권한만 요청합니다
    
    [선택 접근 권한]
    
    · 연락처 : 연락처를 통한 송금과 프로필 사진 등록
    
    · 알림 : ARS 인증번호를 받거나, 토스에서 전달하는 푸시 메세지 수신
    
    · 카메라 : QR코드 / 실물카드 / 신분증 인식, 이미지 업로드, 프로필 등록에 필요
    
    · 사진 : 이미지 저장/업로드 시 필요
    
    · 위치 : 현 위치 확인 및 표시, 부정거래 방지에 필요
    
    · 동작 및 피트니스 : 만보기 서비스에서 걸음 수 측정
    
    · Face ID : 토스 비밀번호 입력을 대체해 인증 진행 시 필요
    
    · 블루투스 : 근처에 있는 기기 식별 및 연결을 위해 필요
    
    * 선택 권한은 허용하지 않아도 서비스를 이용할 수 있으나, 일부 기능 사용에 제한이 있을 수 있습니다.
    
    
    ● 토스 고객센터는 365일 24시간 열려있습니다.
    
    · 전화 1599-4905
    
    · 카카오톡 @toss
    
    · 이메일 support@toss.im
    
    
    (주)비바리퍼블리카
    
    서울시 강남구 테헤란로 142 아크플레이스 12층
    """
        appInfoMoreButton.isHidden = true
    }
}
