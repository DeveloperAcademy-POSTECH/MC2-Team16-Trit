//
//  ParticipateDonCard.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/02.
//

import SwiftUI

struct ParticipateDonCard: View {
    // backend에서 참여자들이 다 참가했으면 "상세정산내역보기" 다 참가하지않았으면 "참석확인중"
    @State var isParticipateIn: Bool
    @Binding var naviSelection: String?
    //    @Binding var spaceID: String
    
    var body: some View {
        NavigationLink(tag: "SpaceMainView", selection: $naviSelection, destination: { SpaceMainView(naviSelection: $naviSelection, spaceID: .constant("123mdk3id2kcjsnj3394jfucr")) }) {
            Button {
                naviSelection = "SpaceMainView"
            } label: {
                ZStack {
                    GradientRoundRec()
                    Circle()
                        .frame(width: 83, height: 83)
                        .foregroundColor(Color(hex: "D8D8D8"))
                        .opacity(0.5)
                    VStack {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        
                        Spacer().frame(height: 60)
                        
                        HStack(alignment: .center, spacing: 5) {
                            if isParticipateIn == false {
                                Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                    .foregroundColor(.white)
                            }
                            Text(isParticipateIn ? "참석 확인중" : "상세정산내역보기")
                                .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                        }
                    }
                    .offset(y: 40)
                }
            }
        }
        .isDetailLink(false)

    }
}

struct BasicRoundRec: View {
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 160, height: 215)
            .opacity(0.8)
//            .shadow(color: .black, radius: 3, x: 0, y: 2)
            .foregroundColor(color)
    }
}

struct GradientRoundRec : View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(colors: [.gradientTopBlue, .gradientBottomBlue], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 160, height: 215)
//            .shadow(color: .black, radius: 3, x: 0, y: 2)
    }
}

/*
struct ParticipateDonCard_Previews: PreviewProvider {
    static var previews: some View {
        ParticipateDonCard(isParticipateIn: false)
    }
}
*/

