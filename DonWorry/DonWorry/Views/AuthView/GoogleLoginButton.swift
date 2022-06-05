//
//  GoogleLoginButton.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/05.
//

import SwiftUI

struct GoogleLoginButton: View {
    var body: some View {
        Button {
            
            // Todo : 소셜 로그인 기능 구현하기
            
        } label: {
            HStack(spacing: 15) {
                Image("Google")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                Text("Google로 로그인")
                    .padding(.leading, 30)
                
            }
            .font(.system(size: 20))
            .foregroundColor(.black)
            .frame(width: 340, height: 58)
            .background(.white)
            .cornerRadius(15)
        }
    }
}

struct GoogleLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleLoginButton()
    }
}
