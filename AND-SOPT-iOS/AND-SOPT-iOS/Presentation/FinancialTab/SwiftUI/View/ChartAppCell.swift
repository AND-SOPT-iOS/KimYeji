//
//  ChartAppCell.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 11/29/24.
//

import SwiftUI

struct ChartAppCell: View {
    let app: RankingApp
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(uiImage: app.appIcon)
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 0.5)
                )
            
            
            HStack(alignment: .top, spacing: 10){
                Text(app.ranking)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.primary)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(app.appName)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Text(app.appDescription)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
            }
            
            Spacer()
            
            Button(action: {}) {
                Text(app.buttonText)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(.blue)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
            }
        }
        .frame(height: 90)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ChartAppCell(app: RankingApp.chartApps[19])
}
