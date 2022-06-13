//
//  AuthViewModel.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/12.
// - https://firebase.google.com/docs/auth/ios/account-linking

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore
import GoogleSignIn
import CryptoKit // Apple Login
import AuthenticationServices // Apple Login

class AuthViewModel: ObservableObject {
    
    // @Published var userSession: FirebaseAuth.User?
    @Published var userSession: Firebase.User? = nil// 현재 로그인 된 유저에 대한 정보 user가 login ? value 가지고 : nil
    @Published var didAuthenticateUser = false // 처음로그인하는 유저인지 아닌지 체크하는 변수
    @Published var currentUser: User?
    @Published var nonce = ""
    private var tempUserSession = Auth.auth().currentUser
    
    private let service = UserService()
    
    init() {
        userSession = Auth.auth().currentUser
        self.fetchUser()
        print("현재로그인된 userSession ID\(userSession?.uid)")
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
    // apple_login
    func appleLogin(credential: ASAuthorizationAppleIDCredential) {
        guard let token = credential.identityToken else {
            print("Firebase Error")
            return
        }
        
        guard let tokenString = String(data: token, encoding: .utf8) else {
            print("Token Error")
            return
        }
        
        let firebaseCredetial = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nonce)
        Auth.auth().signIn(with: firebaseCredetial) { (result, err) in
            
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            /* firestore에 유저 정보추가 */
            guard let user = result?.user else { return }
            self.userSession = user
            print("로그인된 유저 \(self.userSession?.uid)")
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .getDocument { document, _ in
                    if document != nil {
                        // 신규회원이면 user detail 추가
//                                self.didAuthenticateUser = true
                        self.addNewUserToFirestore(userID: user.uid, loginWith: "apple", user: user)
                    }
//                            else {
//                                // 기존회원이면 login
//                                self.didAuthenticateUser = true
//                            }
                }

        }
    }
    
    func googleLogin() {
        
        do {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // 1. GoogleLogin configuration을 생성합니다.
            let config = GIDConfiguration(clientID: clientID)
            let uiViewController = try UIApplication.getRootViewController()
            
            // 2. 생성된 configuration을 이용
            GIDSignIn.sharedInstance.signIn(with: config, presenting: uiViewController) { user, err in
                
                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                
                guard
                    let authentication = user?.authentication,
                    let idToken = authentication.idToken
                else {
                    return
                }
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
                
                // 3. Firebase에 로그인
                Auth.auth().signIn(with: credential) { result, err in

                    if let error = err {
                        print(error.localizedDescription)
                        return
                    }
                     
                    // Users 컬렉션에 해당 uid 가 존재하는지 확인하여 신규 회원 여부 판단
                    // - 기존 회원인 경우 : Sign-In -> home
                    // - 신규 회원인 경우 : Sign-In 후 Firestore에 uid 저장 -> 추가정보 수집
                    
                    guard let user = result?.user else { return }
                    
                    print("로그인된 유저 \(self.userSession?.uid)")
                    
                    Firestore.firestore().collection("users")
                        .document(user.uid)
                        .getDocument { document, _ in
                            if document != nil {
                                // 신규회원이면 user detail 추가
//                                self.didAuthenticateUser = true
                                self.addNewUserToFirestore(userID: user.uid, loginWith: "google", user: user)
                            }
                            else {
                                // 기존회원이면 login 후 홈으로 이동
//                                self.didAuthenticateUser = true
                                self.userSession = user
                            }
                        }
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // 새로 가입한 user의 UID 를 firestore에 등록하여 해당 정보를 db로 관리
    func addNewUserToFirestore(userID: String, loginWith: String, user: Firebase.User?) {
        let data = ["uid": userID, "loginWith": loginWith]
        
        self.tempUserSession = user
        
        Firestore.firestore().collection("users")
            .document(userID)
            .setData(data) { _ in
                // 신규 회원이면 추가정보 입력 페이지로 이동
                self.didAuthenticateUser = true
            }
    }
    
    // 사용자
//    struct User: Identifiable, Decodable {// , Hashable
//        @DocumentID var id: String?
//    //    var id = UUID().uuidString
//        var uid = UUID().uuidString
//        var userName: String // 사용자이름 - 간편로그인 연계
//        var nickName: String // 닉네임
//        var account: String // 계좌정보 Account 참조해야함.
//        var image: String = "default" // 우선 Default 로 하나로 통일 - "default"
//        var profileImage: Image {
//            Image(image)
//        }
//        var spaceList: [String] // 참가한 스페이스 리스트 String 참조해야함
//    }
    
    //
    // https://designcode.io/swiftui-advanced-handbook-write-to-firestore
    func updateNewUserInfo(userName: String?, nickName: String?, account: String?) {
        
        guard let uid = tempUserSession?.uid else { return }
        
        let data = ["uid": uid,
                    "userName": userName,
                    "nickName": nickName,
                    "acount": account
                    ]
        
        print("업데이트 하려는 데이터 \(data)")
        
        Firestore.firestore().collection("users")
            .document(uid)
            .setData(data, merge: true){ error in
                            if let error = error {
                                print("다음 이유로 사용자 추가 정보 입력에 에러가 발생했습니다 : \(error)")
                            } else {
                                print("사용자 추가 정보 입력이 성공적으로 ")
                                self.userSession = self.tempUserSession //main 페이지도 이동
                            }
                        }
    }

    func signOut() {
        // sets user session to nil so we show login view (only client side)
        userSession = nil
        
        // signs user out on server (backend)
        try? Auth.auth().signOut()
    }
    
}
