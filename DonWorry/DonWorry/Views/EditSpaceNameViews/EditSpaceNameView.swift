//
//  EditSpaceNameViews.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/05.
//
//
import SwiftUI

struct EditSpaceNameView: View {
    
    @State var spaceName: String
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
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
                    mode.wrappedValue.dismiss()
                    print("Next level")
                }
                .padding(.top, 23)
                .padding(.trailing, 19)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        print("참석확인")
                        mode.wrappedValue.dismiss()
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
        NavigationView {
            EditSpaceNameView(spaceName: "MC2 아자")
        }
    }
}
