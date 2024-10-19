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
        label.textColor = .gray
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
    
    private let separateLine: UIView = {
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
        [
            appImageImageView,
            appTitleLabel,
            appDescriptionLabel,
            openButton,
            shareButton,
            separateLine
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView.snp.width)
        }

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
        
        separateLine.snp.makeConstraints {
            $0.top.equalTo(openButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(0.3)
        }
    }
    
    
}
