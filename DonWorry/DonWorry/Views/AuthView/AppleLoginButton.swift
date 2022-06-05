//
//  AppleLoginButton.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/05.
//

import SwiftUI

struct AppleLoginButton: View {
    var body: some View {
        Button {
            
            // Todo : 소셜 로그인 기능 구현하기
            
        } label: {
            HStack(spacing: 15) {
                Image(systemName: "applelogo")
                
                Text("Apple로 로그인")
                    .padding(.leading, 42)
                
            }
            .font(.system(size: 20))
            .foregroundColor(.white)
            .frame(width: 340, height: 58)
            .background(.black)
            .cornerRadius(15)
        }
    }
}

struct AppleLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleLoginButton()
    }
}
