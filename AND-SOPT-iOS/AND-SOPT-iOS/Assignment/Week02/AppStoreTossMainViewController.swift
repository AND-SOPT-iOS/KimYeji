//
//  AppStoreTossMainViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/18/24.
//

import UIKit
import SnapKit

class AppStoreTossMainViewController: UIViewController {
    
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
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
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
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let rateTextLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = .systemFont(ofSize: 20, weight: .black)
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
        label.font = .systemFont(ofSize: 15, weight: .bold)
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
        label.text = "새로운 뉴스"
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
        
        return label
    }()
    
    private let appInfoMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .black
    }
    
    private func setUI(){
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
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
            separateLine5
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        [rateCountLabel, rateTextLabel, rateStarLabel].forEach {
            rateStackView.addArrangedSubview($0)
        }
        
        [awardLabel, awardTitleLabel, awardCategoryLabel].forEach {
            awardStackView.addArrangedSubview($0)
        }
        
        [ageTitleLabel, ageTextLabel, ageUnitLabel].forEach {
            ageStackView.addArrangedSubview($0)
        }
        
        
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
            $0.top.equalTo(separateLine1.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        verticalLine1.snp.makeConstraints {
            $0.width.equalTo(0.3)
        }
        
        verticalLine2.snp.makeConstraints {
            $0.width.equalTo(0.3)
        }
        
        separateLine2.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
        
        // MARK: 세번째 섹션
        newNewsTitleLabel.snp.makeConstraints {
            $0.top.equalTo(separateLine2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        versionUpdateRecordButton.snp.makeConstraints{
            $0.centerY.equalTo(newNewsTitleLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        versionTextLabel.snp.makeConstraints{
            $0.top.equalTo(newNewsTitleLabel.snp.bottom).offset(10)
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
            $0.top.equalTo(separateLine3.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        previewImageView.snp.makeConstraints {
            $0.top.equalTo(previewImageLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(600)
        }
        
        deviceImageView.snp.makeConstraints{
            $0.top.equalTo(previewImageView.snp.bottom).offset(15)
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
            $0.top.equalTo(separateLine4.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        appInfoLabel.snp.makeConstraints{
            $0.top.equalTo(appInstallLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
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
            $0.top.equalTo(devloperInfoTextButton.snp.bottom)
            $0.leading.equalTo(devloperInfoTextButton.snp.leading)
        }
        
        developerAppMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(devloperInfoTextButton.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        separateLine5.snp.makeConstraints {
            $0.top.equalTo(developerTextLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
}