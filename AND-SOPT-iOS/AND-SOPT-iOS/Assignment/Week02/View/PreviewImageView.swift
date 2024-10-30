//
//  PreviewImageView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/24/24.
//

import UIKit

class PreviewImageView: UIView {
    // MARK: - Components
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private let previewImageLabel: UILabel = {
        let label = UILabel()
        label.text = "미리 보기"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        
        return label
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
    
    // MARK: - Data
    private var previewImages = PreviewImage.previewImages
    
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
        addSubviews(previewImageLabel, collectionView, deviceImageView, deviceLabel)
    }
    
    private func setLayout() {
        previewImageLabel.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(previewImageLabel.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(600)
        }
        
        deviceImageView.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(10)
            $0.leading.equalTo(previewImageLabel.snp.leading)
        }
        
        deviceLabel.snp.makeConstraints{
            $0.centerY.equalTo(deviceImageView.snp.centerY)
            $0.leading.equalTo(deviceImageView.snp.trailing).offset(5)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = .init(width: 300, height: 600)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        
        collectionView.do{
            $0.setCollectionViewLayout(flowLayout, animated: true)
            $0.register(PreviewImageCell.self,
                        forCellWithReuseIdentifier: PreviewImageCell.identifier)
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

// MARK: - DataSource, Delegate
extension PreviewImageView: UICollectionViewDelegate { }

extension PreviewImageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return previewImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewImageCell.identifier, for: indexPath) as? PreviewImageCell else {
            return UICollectionViewCell()
        }
        
        item.bind(previewImages[indexPath.item])
        return item
    }
}
