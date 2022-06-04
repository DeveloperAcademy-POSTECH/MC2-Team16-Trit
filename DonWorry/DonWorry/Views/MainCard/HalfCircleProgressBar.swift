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
        CircularProgressView(progress: self.$progressValue)
            .frame(width: 160, height: 110).onAppear() {
                progressValue = 0.5*(18000/30000)
            }
    }
}

struct HalfCircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        HalfCircleProgressBar()
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
                .animation(.easeInOut(duration: 2.0))
            
        }
    }
}
