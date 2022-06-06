//
//  EditSpaceNameViews.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/05.
//

import SwiftUI

// image에다가 폰트 적용하는거 너도될듯.
// 전체: 네비게이션뷰 백버튼 지워야할 곳.
// 전체: 네비게이션뷰 왼쪽 오른쪽 패딩
// 이거: 다음의 위치, 택스트필드 길이
struct EditSpaceNameView: View {
    @State var spaceName: String
    var body: some View {
        VStack {
            Text("스페이스\n이름을 설정해주세요")
                .applyTextWithLineLimitModifier(lineLimit: 2, size: 30, weight: .bold, color: .black)
                .lineSpacing(7)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 46)
                .padding(.leading, 25)
                
            UnderlineTextField(placeholder: "스페이스 이름", charLimit: 20, text: $spaceName)
                .padding(.top, 30)
            HStack {
                Spacer()
                SmallButton(text: "다음") {
                    print("Next level")
                }
                .padding(.top, 23)
                .padding(.trailing, 19)
            }
            Spacer()
        }

        .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        print("참석확인")
                    } label: {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.black)
                        
                    }
                }
                
            }
    }
}

struct EditSpaceNameViews_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EditSpaceNameView(spaceName: "MC2 아자")
        }
        
    }
}
