//
//  CalculateStartButtonView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/03.
//
//
import SwiftUI

struct AddCardTitleViewButton: View {
    
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
                    Image(systemName: "plus")
                        .font(Font.system(size: 16, weight: .regular))
                        .padding(10)
                        .background(Color.blueMain)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    
                        Text("정산추가")
                            .applyTextWithLineLimitModifier(size: 14, weight: .bold, color: .blueMain)
                }
            }
        }
        .frame(width: 340)
    }
}

//struct AddCardTitleViewButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpaceMainCalculateStartButton(clicked: {print("")})
//    }
//}
