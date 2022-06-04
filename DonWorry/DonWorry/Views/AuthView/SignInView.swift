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

                    Text("")
                        .frame(height: 120)

                    // 임시로 이미지 클릭하면 다음 페이지로
                    NavigationLink(destination: UserInfoView()) {
                        Image("SignInViewImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 263)

                    }

                    Text("")
                        .frame(height: 52)

                    VStack(spacing: 10) {
                        ForEach(companies, id: \.self) { company in
                            LoginButtonView(company: company)
                        }
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
