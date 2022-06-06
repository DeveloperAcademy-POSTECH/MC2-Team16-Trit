//
//  SignInView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI
import Firebase
import GoogleSignIn

let companies = ["Apple", "KakaoTalk", "Google"]

struct SignInView: View {
    
    
    //SignIn을 위해 선언하였습니다.
    @State var isLoading: Bool = false
    @AppStorage("SignIn Status") var log_status = false
    
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

//                    VStack(spacing: 10) {
//                        ForEach(companies, id: \.self) { company in
//                            LoginButtonView(company: company)
//                        }
//                    }
                    // MARK: Test용 Button (추후에 UI Design이 수정될 것 같아 임시로 기능 확인을 위해 만들었습니다.)
                    Button {
                        googleHandleLogin() //Google Social Login function
                    } label: {
                        HStack(spacing: 20) {
                            Image("Google")
                            Text("구글로 로그인하기")
                        }
                    }
                }
            }
        }
    }
    
    // 구글 소셜 로그인
    func googleHandleLogin() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // 1. GoogleLogin configuration을 생성합니다.
        let config = GIDConfiguration(clientID: clientID)
        
        isLoading = true
        
        // 2. 생성된 configuration을 이용
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) {[self] user, err in
            
            if let error = err {
                isLoading = false
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                isLoading = false
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            // 3. Firebase에 계정 추가
            
            Auth.auth().signIn(with: credential) { result, err in
                
                isLoading = false
                
                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                // 4. 확인을 위해 User name을 출력했습니다. 추후 제거할 의향이 있습니다.
                guard let user = result?.user else {
                    return
                }
                
                print(user.displayName ?? "Success!")
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
