//
//  SignInViewExtension.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/07.
//

import SwiftUI
import Firebase
import GoogleSignIn
import AuthenticationServices
import CryptoKit

extension SignInView {
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
                log_status = true
                print(log_status)
                print(user.displayName ?? "Success!")
            }
        }
    }
}

struct SignInWithAppleButtonView: UIViewRepresentable {
    typealias UIViewType = UIView
    func makeUIView(context: Context) -> UIView {
        
        return ASAuthorizationAppleIDButton(authorizationButtonType: .signUp, authorizationButtonStyle: .black)
      }
      func updateUIView(_ uiView: UIView, context: Context) {
      }

}

