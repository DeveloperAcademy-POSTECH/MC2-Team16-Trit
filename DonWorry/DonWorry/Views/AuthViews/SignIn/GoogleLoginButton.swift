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
            HStack {
                Image("Google")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                
                Spacer()
                    .frame(width: 20)
                
                Text("Google로 로그인")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                
            }
            .frame(width: 330, height: 60)
            .background(RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color(hex: "#FFFFFF")))
        }
    }
}

struct GoogleLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleLoginButton()
    }
}
