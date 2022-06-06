//
//  KakaoTalkLoginButton.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/05.
//

import SwiftUI

struct KakaoTalkLoginButton: View {
    var body: some View {
    
        Button {
            // Todo : 소셜 로그인 기능 추가
        } label: {
            HStack {
                Image("KakaoTalk")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(Color(hex: "#000000"))
                
                Spacer()
                    .frame(width: 75)
                
                Text("카카오 로그인")
                    .font(.system(size: 15))
                    .foregroundColor(Color(hex: "#000000")
                        .opacity(0.85))
            }
            .frame(width: 330, height: 60)
            .background(RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color.yellowKakao))
        }
    }
}

struct KakaoTalkLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        KakaoTalkLoginButton()
    }
}
