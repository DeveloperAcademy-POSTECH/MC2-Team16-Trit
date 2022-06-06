//
//  SpaceMainBottomButton.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/03.
//
//
import SwiftUI

struct SpaceMainBottomButton: View {
    var text: String
    var textSize: CGFloat = 17.0
    var systemImageString: String
    var backgroundColor: Color
    var textColor: Color
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked, label: {
            HStack {
                Text(text)
                    .applyTextWithLineLimitModifier(size: textSize, weight: .bold, color: textColor)
                Image(systemName: systemImageString)
                    .font(Font.system(size: textSize, weight: .light))
                    .foregroundColor(Color.white)
            }
            .applyButtonCustomModifier(backgroundColor: backgroundColor)
        })
    }
}

struct SpaceMainBottomButton_Previews: PreviewProvider {
    static var previews: some View {
        SpaceMainBottomButton(text: "링크 공유", textSize: 17.0, systemImageString: "square.and.arrow.up", backgroundColor: Color.blueMain, textColor: Color.white) {
            print("hi")
        }
    }
}
