//
//  EditNameView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/02.
//
import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var name = ""
    @FocusState private var isFocused: Bool
    
    var isDisable: Bool {
        name.isEmpty
    }
    
    var body: some View {
        VStack {
            
            /* Title */
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("이름을")
                        Text("수정해볼까요?")
                    }
                    .font(.system(size: 30, weight: .heavy))
                    
                }
                Spacer()
            }
            
            .padding(.bottom, 30)
            
            UnderlineTextField(placeholder: "수정할 이름을 입력해주세요", charLimit: 20, text: $name)
                .keyboardType(.default)
            
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    SmallButton(text: "확인", isDisable: isDisable) {
                        /* 닉네임 저장 및 profile 페이지로 back */
                        self.mode.wrappedValue.dismiss()
                    }
                    .padding(.bottom, 30)
                    .disabled(isDisable ? true : false)
                }
                
            }
            
        }
        .onAppear {
            UIApplication.shared.hideKeyboard()
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
                        .padding(.horizontal)
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
