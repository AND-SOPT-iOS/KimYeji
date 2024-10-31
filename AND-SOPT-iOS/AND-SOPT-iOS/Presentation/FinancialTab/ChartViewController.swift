//
//  ChartViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/1/24.
//

import UIKit
import SnapKit
import Then

class ChartViewController: UIViewController {
    private let tableView = UITableView().then {
        $0.register(RankAppTableCell.self, forCellReuseIdentifier: RankAppTableCell.identifier)
        $0.rowHeight = 90
    }
    private let appList = RankingApp.chartApps

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setTableView()
        setNavigationStyle()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func setUI(){
        view.addSubview(tableView)
    }
    
    private func setLayout(){
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - 네비게이션 스타일 설정
    private func setNavigationStyle() {
        self.title = "인기 차트"
    }
}

extension ChartViewController: RankAppTableCellDelegate {
    func downloadButtonTapped(for app: RankingApp) {
        if app.appName == "토스" {
            let tossViewController = AppStoreTossMainViewController()
            navigationController?.pushViewController(tossViewController, animated: true)
        }
    }
}

extension ChartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankAppTableCell.identifier, for: indexPath) as? RankAppTableCell else { return UITableViewCell()
    }
        cell.bind(appList[indexPath.item])
        cell.delegate = self
        return cell
    }
}


