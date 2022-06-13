//
//  SignInView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI
import Firebase
import GoogleSignIn
import AuthenticationServices
import CryptoKit

let companies = ["Apple", "KakaoTalk", "Google"]

struct SignInView: View {
    
    // SignIn을 위해 선언하였습니다.
    @State var isLoading: Bool = true // 추후 ProgressView를 넣을 것으로 예상하여, 변수를 생성
    @StateObject var appleloginData = AppleLoginViewModel() // Firebase 공식 문서의 가이드라인을 따랐습니다.
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, Color.blueMain]), startPoint: .init(x: 0, y: 0.47), endPoint: .init(x: 0, y: 1))
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 15) {
                    Text("돈.워리")
                        .scaledFont(name: CustomFont.GmarketSansBold, size: 30)
                        .foregroundColor(Color.blueMain)
                    
                    VStack {
                        Text("때인돈 받아드립니다.")
                        Text("걱정마세요.")
                    }
                    .scaledFont(name: CustomFont.GmarketSansLight, size: 15)
                    
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
                
                //                    VStack(spacing: 10) {
                //                        ForEach(companies, id: \.self) { company in
                //                            LoginButtonView(company: company)
                //                        }
                //                    }
                // MARK: Test용 Button (추후에 UI Design이 수정될 것 같아 임시로 기능 확인을 위해 만들었습니다.)
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 280, height: 45)
                            .foregroundColor(.white)
                        Button {
                            googleHandleLogin() // Google Social Login function
                        } label: {
                            HStack(alignment: .center) {
                                
                                Image("Google")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                Spacer().frame(width: 3)
                                Text("Sign up with Google")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.black)
                            }
                            .frame(width: 280, height: 45)
                            .background(.clear)
                        }
                    }
                    
                    // Apple SignIn Butoon 입니다.
                    // Xcode에서 SignInWithAppleButton이라는 컴포넌트를 지원합니다.
                    SignInWithAppleButtonView()
                        .cornerRadius(5)
                        .font(.system(size: 30, weight: .medium))
                        .frame(width: 280, height: 50)
                        .onTapGesture {
                            showAppleLogin()
                    }
                }
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

func showAppleLogin() {
    let request = ASAuthorizationAppleIDProvider().createRequest()
    request.requestedScopes = [.email, .fullName]
    let controller = ASAuthorizationController(authorizationRequests: [request])
    controller.performRequests()
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
