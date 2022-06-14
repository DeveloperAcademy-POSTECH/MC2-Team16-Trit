//
//  EditAccountView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/03.
//

import SwiftUI

struct EditAccountView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var holder = ""
    @State private var bank = ""
    @State private var account = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            /* Title */
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    Text("주계좌를")
                    Text("수정해볼까요?")
                }
                .font(.system(size: 30, weight: .heavy))
                
            }
            
            .padding(.bottom, 30)
            
            UnderlineTextField(placeholder: "예금주명을 입력해 주세요.", charLimit: 20, text: $holder)
                .keyboardType(.default)
            
            AccountTextField(account: $account, bank: $bank)
            
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
        .onAppear {
            UIApplication.shared.hideKeyboard()
        }        .navigationBarBackButtonHidden(true)
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

//struct EditAccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
