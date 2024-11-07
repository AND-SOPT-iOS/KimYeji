//
//  FreeChartView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/1/24.
//

import UIKit

protocol FreeChartViewDelegate: AnyObject {
    func freeChartMoreButtonTapped()
}

class FreeChartView: UIView {
    // MARK: - Properties
    weak var cellDelegate: RankAppCollectionCellDelegate?
    weak var delegate: FreeChartViewDelegate?

    private let freeChartLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.text = "무료 순위"
        $0.textColor = .label
    }
    
    private lazy var freeChartMoreButton = UIButton().then {
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold))
        $0.setImage(icon, for: .normal)
        $0.tintColor = .systemGray
        $0.addTarget(self, action: #selector(freeChartMoreButtonTapped), for: .touchUpInside)
    }
    
    private lazy var freeChartCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - Data
    private let freeApps = RankingApp.freeApps
    
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
        addSubviews(freeChartLabel, freeChartMoreButton, freeChartCollectionView)
    }
    
    private func setLayout() {
        freeChartLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
        }
        
        freeChartMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(freeChartLabel.snp.centerY)
            $0.leading.equalTo(freeChartLabel.snp.trailing).offset(5)
        }
        
        freeChartCollectionView.snp.makeConstraints {
            $0.top.equalTo(freeChartMoreButton.snp.bottom).offset(5)
            $0.height.equalTo(290)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        let itemSize = (UIScreen.main.bounds.width - 60)
        
        flowLayout.itemSize = CGSize(width: itemSize, height: 90)
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .horizontal
        
        freeChartCollectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: true)
            $0.register(RankAppCollectionCell.self, forCellWithReuseIdentifier: RankAppCollectionCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    // MARK: - Actions
    @objc private func freeChartMoreButtonTapped() {
        delegate?.freeChartMoreButtonTapped()
    }
}

// MARK: - Delegate, DataSource
extension FreeChartView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return freeApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RankAppCollectionCell.identifier, for: indexPath) as? RankAppCollectionCell else {
            return UICollectionViewCell()
        }
        
        item.bind(freeApps[indexPath.item])
        item.delegate = cellDelegate
        return item
    }
}
