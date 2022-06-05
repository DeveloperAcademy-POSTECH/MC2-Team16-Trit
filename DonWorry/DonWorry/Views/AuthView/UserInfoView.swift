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
    @State private var holder = ""
    
    var body: some View {
        VStack {
            Text("돈.워리")
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 45) {
                
                // 공통 텍스트필드 입력 컴포넌트(닉네임)
                VStack(alignment: .leading) {
                    Text("닉네임")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                    UnderlineTextField(placeholder: "닉네임을 입력해주세요", charLimit: 20, text: $nickName)
                    
                }
                
                // 계좌번호
                VStack(alignment: .leading) {
                    Text("계좌번호")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                    
                    AccountTextField()
                    
                    Text("정산을 받으실 계좌번호입니다.(추후 변경 가능)")
                        .font(.system(size: 13))
                        .foregroundColor(Color.grayC5)
                    
                }
                
                // 공통 텍스트필드 입력 컴포넌트(예금주명)
                VStack(alignment: .leading) {
                    Text("예금주명")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                    
                    UnderlineTextField(placeholder: "예금주명을 입력해주세요", charLimit: 20, text: $holder)
                }
                
            }
            
            Spacer()
            
            // 공용 컴포넌트 다음
            
            NavigationLink(destination: ToSView()) {
                
                Text("다음")
                    .frame(width: 100, height: 20, alignment: .center)
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .bold))
                    .padding()
                    .background(Color.blueMain)
                    .cornerRadius(50)
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