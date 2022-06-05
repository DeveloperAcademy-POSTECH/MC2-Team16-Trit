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
            
            // Todo : 소셜 로그인 기능 구현하기
            
        } label: {
            HStack(spacing: 15) {
                
                Image("KakaoTalk")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                
                Text("KakaoTalk로 로그인")
                
            }
            .font(.system(size: 20))
            .foregroundColor(.black)
            .frame(width: 340, height: 58)
            .background(Color.yellowKakao)
            .cornerRadius(15)
        }
    }
}

struct KakaoTalkLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        KakaoTalkLoginButton()
    }
}
