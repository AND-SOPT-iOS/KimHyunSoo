//
//  Week6ChartCell.swift
//  2nd-Seminar
//
//  Created by MaengKim on 11/29/24.
//
import SwiftUI

struct Week6ChartCellView: View {
    let app: PopularChartsApp
    let index: Int
    let buttonTapped: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            Image(uiImage: app.iconImage)
                .resizable()
                .frame(width: 65, height: 65)
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("\(app.ranking)")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(app.title)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .truncationMode(.tail)
                }
                Text(app.subTitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            Spacer()
            
            Button(action: buttonTapped) {
                Text(app.downloadState.rawValue)
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 60, height: 25)
                    .background(Color.gray)
                    .foregroundColor(.blue)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color.black)
    }
}
