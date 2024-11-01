//
//  EssentialFinancialView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class EssentialFinancialView: UIView {
    // MARK: - Components
    
    private let essentialFinancialLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.text = "필수 금융 앱"
        $0.textColor = .label
    }
    
    private let editorSelectLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .systemGray
        $0.text = "App Store 에디터가 직접 골랐습니다"
    }
    
    private let essentialAppMoreButton = UIButton().then{
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .bold))
        $0.setImage(icon, for: .normal)
        $0.tintColor = .systemGray
    }
    
    private lazy var essentialFinancialCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - Data
    private let essentialFinancialData = EssentialFinancialApp.essentialFinancialApps
    
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
        addSubviews(essentialFinancialLabel, editorSelectLabel, essentialAppMoreButton, essentialFinancialCollectionView)
    }
    
    private func setLayout() {
        essentialFinancialLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
        }
        
        essentialAppMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(essentialFinancialLabel.snp.centerY)
            $0.leading.equalTo(essentialFinancialLabel.snp.trailing).offset(5)
        }
        
        editorSelectLabel.snp.makeConstraints {
            $0.top.equalTo(essentialFinancialLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview()
        }
        
        essentialFinancialCollectionView.snp.makeConstraints {
            $0.top.equalTo(editorSelectLabel.snp.bottom).offset(5)
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
        
        essentialFinancialCollectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: true)
            $0.register(EssentialFinancialCell.self, forCellWithReuseIdentifier: EssentialFinancialCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
}

// MARK: - Delegate, DataSource
extension EssentialFinancialView: UICollectionViewDelegate { }

extension EssentialFinancialView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return essentialFinancialData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: EssentialFinancialCell.identifier, for: indexPath) as? EssentialFinancialCell else {
            return UICollectionViewCell()
        }
        
        item.bind(essentialFinancialData[indexPath.item])
        return item
    }
}
