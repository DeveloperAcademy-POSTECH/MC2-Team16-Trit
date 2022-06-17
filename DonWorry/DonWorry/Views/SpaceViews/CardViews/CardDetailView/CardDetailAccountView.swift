//
//  CardDetailAccountView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/16.
//

import SwiftUI

struct CardDetailAccountView: View {
    let isAdmin: Bool
    var body: some View {
        if isAdmin {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("우리은행")
                            .applyTextWithLineLimitModifier(size: 13, weight: .bold, color: .grayAccount)
                    }
                    .padding(.bottom, 5)
                    HStack {
                        Text("42991010090307")
                            .applyTextWithLineLimitModifier(size: 13, weight: .regular, color: .grayAccount)
                        Text("(이한규)")
                            .applyTextWithLineLimitModifier(size: 13, weight: .regular, color: .grayAccount)
                    }
                }
                Spacer()
                VStack(spacing: 6) {
                    Image("user1")
                        .applyClipCircleModifier(width: 35, height: 35)
                    Text("김유쓰")
                        .applyTextWithLineLimitModifier(size: 13, weight: .bold, color: .black)
                }
            }
            .padding(20)
            .frame(width: 340, height: 90, alignment: .leading)
            .background(Color.grayF0)
            .cornerRadius(8)
            .padding(.top, 13.5)
        } else {
            VStack(spacing: 6) {
                Image("user1")
                    .applyClipCircleModifier(width: 30, height: 30)
                Text("김유쓰")
                    .applyTextWithLineLimitModifier(size: 13, weight: .medium, color: .black)
            }
            .frame(width: 340, height: 90, alignment: .leading)
            .padding(.top, 13.5)
        }
        
    }
}

struct CardDetailAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailAccountView(isAdmin: true)
    }
}
