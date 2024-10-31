//
//  PaidChartView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/31/24.
//

import UIKit

class PaidChartView: UIView {
    // MARK: - Components
    
    private let paidChartLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.text = "유료 순위"
        $0.textColor = .label
    }
    
    private let paidChartMoreButton = UIButton().then{
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold))
        $0.setImage(icon, for: .normal)
        $0.tintColor = .systemGray
    }

    private lazy var paidChartCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - Data
    private let paidApps = RankingApp.paidApps
    
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
        addSubviews(paidChartLabel, paidChartMoreButton, paidChartCollectionView)
    }

    private func setLayout(){
        paidChartLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
        }
        
        paidChartMoreButton.snp.makeConstraints{
            $0.centerY.equalTo(paidChartLabel.snp.centerY)
            $0.leading.equalTo(paidChartLabel.snp.trailing).offset(5)
        }
        
        paidChartCollectionView.snp.makeConstraints{
            $0.top.equalTo(paidChartLabel.snp.bottom).offset(5)
            $0.height.equalTo(290)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    private func setCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        let itemSize = (UIScreen.main.bounds.width - 60)
        
        flowLayout.itemSize =  CGSize(width: itemSize, height: 90)
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .horizontal
        
        paidChartCollectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: true)
            $0.register(RankAppCollectionCell.self, forCellWithReuseIdentifier: RankAppCollectionCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
}

extension PaidChartView: UICollectionViewDelegate { }

extension PaidChartView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paidApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RankAppCollectionCell.identifier, for: indexPath) as? RankAppCollectionCell else {
            return UICollectionViewCell()
        }
        
        item.bind(paidApps[indexPath.item])
        return item
    }
}
