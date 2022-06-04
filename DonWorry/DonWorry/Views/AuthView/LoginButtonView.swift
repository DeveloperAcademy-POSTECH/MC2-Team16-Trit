//
//  LoginButtonView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

let companyColor = ["Apple": "E7E7E7", "KakaoTalk": "FFE810", "Google": "FFFFFF"]

struct LoginButtonView: View {
    let company: String
    
    var body: some View {
        Button {
            // 소셜 로그인 기능 구현하기
            
        } label: {
            HStack(spacing: 100) {
                Image(company)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)     
                Text("\(company)로 로그인")
                    .font(.system(size: 15, weight: .bold))
                
            }
            .frame(width: 340, height: 58)
            .background(Color(hex: companyColor[company] ?? "000000"))
            .cornerRadius(15)
        }
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView(company: "Apple")
    }
}
