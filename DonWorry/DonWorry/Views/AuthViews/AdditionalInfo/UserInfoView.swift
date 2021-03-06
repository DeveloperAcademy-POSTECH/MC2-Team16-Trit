//
//  UserInfoView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

struct UserInfoView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var authViewModel: AuthViewModel

    @State private var nickName = ""
//    @State private var account = ""
//    @State private var bank = ""
    @State private var holder = ""
    @State private var naviSelection: String? = nil
    @FocusState private var isFocused: Bool

//    var isDisable: Bool {
//        nickName.isEmpty || account.isEmpty || holder.isEmpty || bank.isEmpty
//    }

    var isDisable: Bool {
        nickName.isEmpty || holder.isEmpty
    }
    
    var body: some View {
        VStack {
            Text("돈.워리")
                .scaledFont(name: CustomFont.GmarketSansBold, size: 30)
            
            Spacer()
                .frame(height: 70)

            ScrollView {
                VStack(alignment: .leading, spacing: 45) {

                    VStack(alignment: .leading) {
                        HStack {
                            Text("닉네임")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)

                        }
                        UnderlineTextField(placeholder: "친구들이 나를 찾을 닉네임을 입력해주세요.", charLimit: 20, text: $nickName)
                            .keyboardType(.default)
                            .focused($isFocused)
                    }
                    
                    // 공통 텍스트필드 입력 컴포넌트(성명)
                    VStack(alignment: .leading) {
                        Text("성명")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)

                        UnderlineTextField(placeholder: "성명을 입력해주세요", charLimit: 10, text: $holder)
                            .focused($isFocused)
                    }

//                    VStack(alignment: .leading) {
//                        Text("계좌번호")
//                            .font(.system(size: 17))
//                            .fontWeight(.semibold)
//
//                        AccountTextField(account: $account, bank: $bank)
//                            .focused($isFocused)
//
//                        Text("정산을 받으실 계좌번호입니다.(추후 변경 가능)")
//                            .font(.system(size: 13))
//                            .foregroundColor(Color.grayC5)
//
//                    }
                    
                }
                
            }
            
            Spacer()
            
            NavigationLink(tag: "GetUserAccountView", selection: $naviSelection, destination: { GetUserAccountView().environmentObject(authViewModel) }) { SmallButton(text: "다음", isDisable: isDisable) {
                naviSelection = "GetUserAccountView"
            }}
            .disabled(isDisable ? true : false)
            .padding(.bottom)
        }
        .onAppear {
            UIApplication.shared.hideKeyboard()
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
