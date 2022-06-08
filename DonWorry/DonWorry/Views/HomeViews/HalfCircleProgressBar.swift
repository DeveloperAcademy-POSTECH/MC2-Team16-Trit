//
//  HalfCircleProgressBar.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/04.
//

import SwiftUI

struct HalfCircleProgressBar: View {
    @State var progressValue: Float = 0.0
    var body: some View {
        // 우선은 하드코딩 나중에 돈받은만큼 비율계산해서 넣으면 비율만큼 progressbar가 채워짐
        CircularProgressView(progress: self.$progressValue)
            .frame(width: 160, height: 110).onAppear {
                // taker가 받아야할돈(여기선 30000원) 현재 정산 완료된 금액(18000원)
                progressValue = 0.5*(18000/30000)
            }
    }
}

struct CircularProgressView: View {
    @Binding var progress: Float
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(hex: "D8D8D8"))
            
            Circle()
                .trim(from: 0, to: CGFloat(min(self.progress, 0.5)))
                .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(hex: "2CD08B"))
                .opacity(0.7)
                .shadow(color: .black, radius: 2, y: -2)
                .rotationEffect(.degrees(180))
        }
    }
}

/*
struct HalfCircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        HalfCircleProgressBar()
    }
}
 */
