//
//  RankAppTableCell.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/1/24.
//

import UIKit

protocol RankAppTableCellDelegate: AnyObject {
    func downloadButtonTapped(for app: RankingApp)
}

class RankAppTableCell: UITableViewCell {
    // MARK: - Properties
    
    static let identifier: String = "RankAppTableCell"
    weak var delegate: RankAppTableCellDelegate?
    private var app: RankingApp?
    
    // MARK: - Components
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    private let rankLabel = UILabel().then{
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    private let appNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .label
        $0.numberOfLines = 2
    }
    
    private let appDescriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .systemGray
        $0.numberOfLines = 2
    }
    
    private lazy var downloadButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.backgroundColor = .tertiarySystemFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI, Layout
    private func setUI(){
        contentView.addSubviews(iconImageView, rankLabel, appNameLabel, appDescriptionLabel, downloadButton)
    }
    
    private func setLayout(){
        iconImageView.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
            $0.size.equalTo(70)
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(20)
        }
        
        rankLabel.setContentHuggingPriority(.required, for: .horizontal)
        rankLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        appNameLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(13)
            $0.top.equalTo(rankLabel.snp.top)
            $0.trailing.lessThanOrEqualTo(downloadButton.snp.leading).offset(-8)
        }
        
        appDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(appNameLabel.snp.leading)
            $0.top.equalTo(appNameLabel.snp.bottom).offset(5)
            $0.trailing.lessThanOrEqualTo(downloadButton.snp.leading).offset(-8)
            $0.bottom.lessThanOrEqualToSuperview().inset(12)
        }
        
        downloadButton.snp.makeConstraints{
            $0.centerY.equalTo(iconImageView.snp.centerY)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
    }
    
    // MARK: - Bind
    func bind(_ app : RankingApp) {
        self.app = app
        iconImageView.image = app.appIcon
        rankLabel.text = app.ranking
        appNameLabel.text = app.appName
        appDescriptionLabel.text = app.appDescription
        downloadButton.setTitle(app.buttonText, for: .normal)
    }
    
    // MARK: - Actions
    @objc private func downloadButtonTapped() {
        guard let app = app else { return }
        delegate?.downloadButtonTapped(for: app)
    }
}
