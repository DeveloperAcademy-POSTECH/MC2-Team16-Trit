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
            HStack {
                Image("Apple")
                
                Spacer()
                    .frame(width: 30)
                
                Text("Apple로 로그인")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                
            }
            .frame(width: 330, height: 60)
            .background(RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color.black))
        }
    }
}

struct AppleLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleLoginButton()
    }
}
