//
//  EditNameView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/02.
//
import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var selectedTag: String?
        
    var body: some View {
        VStack(alignment: .leading) {
            
            /* Title */
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    Text("이름을")
                    Text("수정해볼까요?")
                }
                .font(.system(size: 30, weight: .heavy))
                
            }
            
            .padding(.bottom, 30)
            
//            UnderlineTextField(placeholder: "수정할 이름을 입력해주세요", charLimit: 20)
            
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    SmallButton(text: "확인") {
                        /* 닉네임 저장 및 profile 페이지로 back */
                    }
                    .padding(.bottom, 30)
                }
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .padding(.top, -20)
        .padding(.horizontal, 25)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
            
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}