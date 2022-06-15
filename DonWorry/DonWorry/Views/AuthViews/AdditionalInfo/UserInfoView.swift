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
    @State private var holder = ""
    @State private var naviSelection: String? = nil
    
    var body: some View {
        VStack {
            Text("돈.워리")
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 45) {
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("닉네임")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                        
                    }
                    UnderlineTextField(placeholder: "친구들이 나를 찾을 닉네임을 입력해주세요.", charLimit: 20, text: $nickName)
                    
                }
                
                VStack(alignment: .leading) {
                    Text("계좌번호")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                    
//                    AccountTextField()
                    
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
                }
                
            }
            
            Spacer()
            
            
            /* 다음 -> 텀뷰 */
            NavigationLink(tag: "TermView", selection: $naviSelection, destination: { TermView() }) {
                EmptyView()
            }
            
            SmallButton(text: "다음") {
//                authViewModel.updateNewUserInfo(userName: "정찬희", nickName: "버리" , account: "1234556")
                naviSelection = "TermView"
            }

            
        }
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
