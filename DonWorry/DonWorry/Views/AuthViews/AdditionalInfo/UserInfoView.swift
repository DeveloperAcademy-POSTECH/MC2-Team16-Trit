//
//  UserInfoView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

struct UserInfoView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var nickName = ""
    @State private var account = ""
    @State private var bank = ""
    @State private var holder = ""
    @State private var naviSelection: String? = nil
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            Text("돈.워리")
                .scaledFont(name: CustomFont.GmarketSansBold, size: 30)
            
            Spacer()
            
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
                
                VStack(alignment: .leading) {
                    Text("계좌번호")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                    
                    AccountTextField(account: $account, bank: $bank)
                        .focused($isFocused)
                    
                    Text("정산을 받으실 계좌번호입니다.(추후 변경 가능)")
                        .font(.system(size: 13))
                        .foregroundColor(Color.grayC5)
                    
                }
                
                // 공통 텍스트필드 입력 컴포넌트(예금주명)
                VStack(alignment: .leading) {
                    Text("예금주명")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                    
                    UnderlineTextField(placeholder: "예금주명을 입력해주세요", charLimit: 10, text: $holder)
                        .focused($isFocused)
                }
                
            }
            
            Spacer()
            
            NavigationLink(tag: "TermView", selection: $naviSelection, destination: { TermView() }) { SmallButton(text: "다음") {
                naviSelection = "TermView"
            } }
            
            //                NavigationLink(destination: TermView()) {
            //
            //                    Text("다음")
            //                        .frame(width: 100, height: 20, alignment: .center)
            //                        .foregroundColor(Color.white)
            //                        .font(.system(size: 15, weight: .bold))
            //                        .padding()
            //                        .background(Color.blueMain)
            //                        .cornerRadius(50)
            //                }
        }
        .onAppear {
            UIApplication.shared.hideKeyboard()
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
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

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
