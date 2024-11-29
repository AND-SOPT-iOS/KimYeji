//
//  ChartView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/29/24.
//

import SwiftUI

struct ChartView: View {
    let appList: [RankingApp] = RankingApp.chartApps
    
    var body: some View {
        NavigationView {
            List(appList, id: \.ranking) { app in
                ChartAppCell(app: app)
                    .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
            .navigationTitle("인기 차트 (스유)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ChartView()
}
