//
//  RecommendationView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class RecommendationView: UIView {
    // MARK: - Components
    private lazy var recommendationCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - Properties
    private let recommendationItem = Recommendation.recommendationItems
    
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
    
    // MARK: - UI, Layout, CollectionView
    private func setUI() {
        addSubviews(recommendationCollectionView)
    }
    
    private func setLayout(){
        recommendationCollectionView.snp.makeConstraints{
            $0.verticalEdges.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 60, height: 280)
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        
        recommendationCollectionView.do{
            $0.setCollectionViewLayout(flowLayout, animated: true)
            $0.register(RecommendationCell.self,
                        forCellWithReuseIdentifier: RecommendationCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
}

// MARK: DataSource, Delegate
extension RecommendationView: UICollectionViewDelegate { }

extension RecommendationView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendationItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendationCell.identifier, for: indexPath) as? RecommendationCell else {
            return UICollectionViewCell()
        }
        
        item.bind(recommendationItem[indexPath.item])
        return item
    }
}
