//
//  PreviewImageView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/24/24.
//

import UIKit

class PreviewImageView: UIView {
    // MARK: - Components
    
    private let previewImageLabel: UILabel = {
        let label = UILabel()
        label.text = "미리 보기"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private let previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tossPreview1.png")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let deviceImageView: UIImageView = {
        let imageView = UIImageView()
        let deviceIcon = UIImage(systemName: "iphone", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        imageView.image = deviceIcon
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray
        
        return imageView
    }()
    
    private let deviceLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .systemGray
        
        return label
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI, Layout
    private func setUI() {
        addSubviews(previewImageLabel, previewImageView, deviceImageView, deviceLabel)
    }

    private func setLayout() {
        previewImageLabel.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
        }
        
        previewImageView.snp.makeConstraints {
            $0.top.equalTo(previewImageLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(600)
        }
        
        deviceImageView.snp.makeConstraints{
            $0.top.equalTo(previewImageView.snp.bottom).offset(10)
            $0.leading.equalTo(previewImageLabel.snp.leading)
        }
        
        deviceLabel.snp.makeConstraints{
            $0.centerY.equalTo(deviceImageView.snp.centerY)
            $0.leading.equalTo(deviceImageView.snp.trailing).offset(5)
            $0.bottom.equalToSuperview()
        }
    }
}
