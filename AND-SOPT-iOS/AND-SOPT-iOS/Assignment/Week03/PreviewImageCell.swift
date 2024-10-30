//
//  PreviewImageCell.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/30/24.
//

import UIKit

class PreviewImageCell: UICollectionViewCell {
    static let identifier = "PreviewImageCell"
    
    private lazy var previewImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        previewImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }
    }
    
    private func setUI() {
        addSubview(previewImageView)
    }
    
    private func setLayout() {
        previewImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bind(_ previewImage: PreviewImage) {
        previewImageView.image = previewImage.image
    }
}
