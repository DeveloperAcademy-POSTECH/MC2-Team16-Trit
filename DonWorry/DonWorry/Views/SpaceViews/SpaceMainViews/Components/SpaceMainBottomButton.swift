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
    var systemImageString: String? 
    var backgroundColor: Color
    var textColor: Color
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked, label: {
            HStack {
                Text(text)
                systemImageString.map {
                    Image(systemName: $0)
              
                }
            }
            .applyButtonCustomModifier(backgroundColor: backgroundColor, strokeLineWith: 0)
        }
        )
        .contentShape(Capsule())
        .frame(height: 20, alignment: .center)
        .foregroundColor(Color.white)
        .font(.system(size: 15, weight: .bold))
        
    }
}

struct SpaceMainBottomButton_Previews: PreviewProvider {
    static var previews: some View {
        SpaceMainBottomButton(text: "링크 공유", systemImageString: "square.and.arrow.up", backgroundColor: Color.blueMain, textColor: Color.white) {
            print("hi")
        }
    }
}
