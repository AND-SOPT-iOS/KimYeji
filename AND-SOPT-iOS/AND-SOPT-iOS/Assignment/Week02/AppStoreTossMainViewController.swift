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
        image.clipsToBounds = true
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
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 17
        button.clipsToBounds = true
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
        label.font = .systemFont(ofSize: 25, weight: .black)
        label.textColor = .systemGray
        return label
    }()
    
    private let rateStarLabel: UILabel = {
        let label = UILabel()
        label.text = "★★★★☆"
        label.font = .systemFont(ofSize: 17, weight: .bold)
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
        label.font = .systemFont(ofSize: 17, weight: .bold)
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
        label.font = .systemFont(ofSize: 25, weight: .black)
        label.textColor = .systemGray
        return label
    }()
    
    private let ageUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "세"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private let separateLine2: UIView = {
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
            separateLine2
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
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        // MARK: 첫번째 섹션
        appImageImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(contentView).offset(20)
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
            $0.leading.equalTo(openButton.snp.trailing).offset(110)
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
    }
}
