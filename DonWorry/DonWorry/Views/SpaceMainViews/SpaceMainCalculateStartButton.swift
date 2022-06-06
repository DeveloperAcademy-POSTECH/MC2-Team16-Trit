//
//  CalculateStartButtonView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/03.
//
//
import SwiftUI

struct SpaceMainCalculateStartButton: View {
    var clicked: () -> Void
    var body: some View {
        Button(action: clicked) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.grayBC)
                    .frame(height: 127)
                    .shadow(radius: 2)
                    .opacity(0.3)
                VStack(spacing: 10) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(Font.system(size: 36, weight: .ultraLight))
                        .foregroundColor(Color(hex: "#1c6bff"))
                        .foregroundColor(.blueMain)
                    Text("정산 시작")
                        .foregroundColor(Color(hex: "#1c6bff"))
                }
            }
        }
        .frame(width: 340)
    }
}

struct CalculateStartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceMainCalculateStartButton(clicked: {print("")})
    }
}
