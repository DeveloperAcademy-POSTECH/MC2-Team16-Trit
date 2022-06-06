//
//  SignInView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

let companies = ["Apple", "KakaoTalk", "Google"]

struct SignInView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, Color.blueMain]), startPoint: .init(x: 0, y: 0.47), endPoint: .init(x: 0, y: 1))
                    .ignoresSafeArea()

                VStack {
                    VStack(spacing: 15) {
                        Text("돈.워리")
                            .foregroundColor(Color.blueMain)
                            .font(.system(size: 30))
                            .fontWeight(.bold)

                        VStack {
                            Text("때인돈 받아드립니다.")
                                .fontWeight(.light)
                            Text("걱정마세요.")
                                .fontWeight(.light)
                        }
                        .font(.system(size: 15))

                    }
                    .padding(.bottom, 70)
           
                    NavigationLink(destination: UserInfoView()) {
                        Image("SignInViewImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 230)

                    }
                    .padding(.vertical, 50)

                    VStack(spacing: 10) {
                        AppleLoginButton()
                        KakaoTalkLoginButton()
                        GoogleLoginButton()
                    }
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
