//
//  PreviewImageCell.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/30/24.
//

import UIKit

final class PreviewImageCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "PreviewImageCell"
    
    // MARK: - Components
    
    private lazy var previewImageView = UIImageView()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Style, UI, Layout
    private func setStyle() {
        previewImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }
    }
    
    private func setUI() {
        addSubviews(previewImageView)
    }
    
    private func setLayout() {
        previewImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Bind
    func bind(_ previewImage: PreviewImage) {
        previewImageView.image = previewImage.image
    }
}
