//
//  SwiftUIView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//
//
import SwiftUI

struct SpaceTopView: View {
    
    let leftPaddingSize = 25.0
    @Binding var mainSelection: String?
    @Binding var spaceID: String
    @State private var naviSelection: String? = nil
    
    var body: some View {
        HStack {
            Text("Space ID : \(spaceID)")
                .applyTextWithLineLimitModifier(size: 14, weight: .regular, color: .black)
                .opacity(0.5)
                .padding(.leading, leftPaddingSize)
            Button {
                print("")
            } label: {
                Text("복사하기")
                    .applyTextWithLineLimitModifier(size: 9, weight: .bold, color: .white)
                    .applyButtonCustomModifier(backgroundColor: .grayC5, width: 47, height: 19, padding: 3)
            }
            Spacer()
            
            NavigationLink(tag: "CalculateStartView", selection: $naviSelection, destination: { HomeView(currentUser: user1) }) { EmptyView() }
            .isDetailLink(false)
            Button {
                self.naviSelection = "CalculateStartView"
            } label: {
                Text("정산시작")
                    .applyTextWithLineLimitModifier(size: 16.0, weight: .bold, color: .blueMain)
                    .applyButtonCustomModifier(backgroundColor: .paleBlue, width: 92, height: 26, padding: 4, cornerRadius: 16, strokeLineWith: 0)
                    .padding(.trailing, leftPaddingSize)
            }
        }
    }
}

struct SpaceTopView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceTopView(mainSelection: .constant(""), spaceID: .constant("asdvasdvasdvas"))
    }
}
