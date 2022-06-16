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
    @State var isLoading: Bool = false // 추후 ProgressView를 넣을 것으로 예상하여, 변수를 생성
    @AppStorage("SignIn Status") var log_status = true // SignIn상태 저장
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        
        if viewModel.didAuthenticateUser {
            
            UserInfoView()
            
        } else {
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

//                    VStack(spacing: 10) {
//                        ForEach(companies, id: \.self) { company in
//                            LoginButtonView(company: company)
//                        }
//                    }
                    // MARK: Test용 Button (추후에 UI Design이 수정될 것 같아 임시로 기능 확인을 위해 만들었습니다.)
                    VStack {
                        Button {
//                                googleHandleLogin() // Google Social Login function
                            viewModel.googleLogin()
                        } label: {
                            HStack(spacing: 20) {
                                Image("Google")
                                Text("구글로 로그인하기")
                            }
                        }
            
                        // Apple SignIn Butoon 입니다.
                        // Xcode에서 SignInWithAppleButton이라는 컴포넌트를 지원합니다.
                        SignInWithAppleButton { (request) in
                            viewModel.nonce = randomNonceString()
                            request.requestedScopes = [.email, .fullName]
                            request.nonce = sha256(viewModel.nonce)
                        } onCompletion: { (result) in
                            
                            switch result {
                            case .success(let user): // 로그인에 성공한 경우
                                print("성공")
                                guard let credential = user.credential as?
                                        ASAuthorizationAppleIDCredential else {
                                    print("Firebase 오류") // credential 생성 성공여부
                                    return
                                }
                                viewModel.appleLogin(credential: credential)
                                log_status = true
                            case .failure(let error): // 로그인에 실패한 경우
                                print(error.localizedDescription)
                            }
                        }.frame(width: 325, height: 70)
                            .clipShape(Capsule())
                    }
                }
            }
            .ignoresSafeArea()
            .overlay(Group {
                    if isLoading {
                        ProgressView()
                    }
                })
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
