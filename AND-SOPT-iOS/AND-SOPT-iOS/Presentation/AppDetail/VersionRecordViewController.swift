//
//  VersionRecordViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/23/24.
//

import UIKit
import SnapKit

class VersionRecordViewController: UIViewController {
    private let versionRecordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "버전 기록 페이지"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func setUI(){
        self.view.addSubview(versionRecordTitleLabel)
    }
    
    private func setLayout(){
        versionRecordTitleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
}
