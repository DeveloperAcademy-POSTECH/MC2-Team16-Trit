//
//  ParticipateCard.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/02.
//

import SwiftUI

struct ParticipateCard: View {
    @State var isOnParticipate: Bool
    var body: some View {
        
        Button {
            //
        } label: {
            ZStack {
                BasicRoundRec(color: .blueMain)
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
                        if isOnParticipate == false {
                            Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                .foregroundColor(.white)
                        }
                        Text(isOnParticipate ? "참석 확인중" : "상세정산내역보기")
                            .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                    }
                }
                .offset(y: 40)
            }
        }
    }
}

struct ParticipateCard_Previews: PreviewProvider {
    static var previews: some View {
        ParticipateCard(isOnParticipate: false)
    }
}

struct BasicRoundRec: View {
    var color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(width: 160, height: 215)
            .opacity(0.8)
            .shadow(color: .black, radius: 3, x: 0, y: 2)
            .foregroundColor(color)
    }
}
