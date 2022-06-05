//
//  SwiftUIView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI

struct SpaceTopView: View {
    let leftPaddingSize = 25.0
    var spaceID: String = ""
    var body: some View {
        HStack {
            Text("Space ID : \(spaceID)")
                .applyTextWithLineLimitModifier(size: 14, weight: .bold, color: .black)
                .opacity(0.5)
                .padding(.leading, leftPaddingSize)
            Spacer()
            Button {
                print("")
            } label: {
                Text("복사하기")
                    .applyTextWithLineLimitModifier(size: 9, weight: .bold, color: .white)
                    .applyButtonCustomModifier(backgroundColor: .grayC5, width: 47, height: 19, padding: 3)
            }
            Button {
                print("정산추가")
            } label: {
                Text("정산추가")
                    .applyTextWithLineLimitModifier(size: 16.0, weight: .bold, color: .blueMain)
                    .applyButtonCustomModifier(backgroundColor: Color(hex: "#DFEAFF"), width: 92, height: 26, padding: 4, cornerRadius: 16, strokeLineWith: 0)
                    .padding(.trailing, leftPaddingSize)
            }
        }
    }
}

struct SpaceTopView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceTopView()
    }
}
