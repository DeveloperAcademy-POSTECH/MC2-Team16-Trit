//
//  AuthViewModel.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/12.
//
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
    @Published var errorMessage: String?
    @Published var nonce = "" // apple login
    @Published var userSession: Firebase.User? = nil// 현재 로그인 된 유저에 대한 정보 user가 login ? value 가지고 : nil
    @Published var didAuthenticateUser = false // 처음로그인하는 유저인지 아닌지 체크하는 변수
    @Published var currentUser: User = .empty
    @Published var isLoading: Bool = false
    @Published var tmpUser: User = .empty
    
    @EnvironmentObject var accountViewModel: AccountViewModel
    
    private var tempUserSession = Auth.auth().currentUser // 회원가입시, 추가정보 받기 위해서 존재
    private var db = Firestore.firestore()
    private let service = UserService()
    
    init() {
        userSession = Auth.auth().currentUser
        self.fetchUser()
        print("현재로그인된 userSession ID\(userSession?.uid)")
    }
    
    // MARK: fetchUser()
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
//            print("현재유저 \(user.id)")
        }
         
    }
    
    // MARK: fetchUser(uid)
    func fetchUser(uid: String) {
        
        Firestore.firestore()
            .collection("users")
            .document(uid).getDocument { snapshot, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = snapshot?.data() else { return }
                
                print("DEBUG: 현재 유저의 snapshot\(user)")
                
            }
        
    }
    
    // MARK: 애플로그인
    func appleLogin(credential: ASAuthorizationAppleIDCredential) {
        guard let token = credential.identityToken else {
            print("Firebase Error")
            return
        }
        
        guard let tokenString = String(data: token, encoding: .utf8) else {
            print("Token Error")
            return
        }
        
        let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nonce)
        // 3. Firebase에 로그인
        Auth.auth().signIn(with: credential) { result, err in
            
            self.isLoading = true

            if let error = err {
                print("firebase로그인 에러"+error.localizedDescription)
                self.isLoading = false
                return
            }
             
            // Users 컬렉션에 해당 uid 가 존재하는지 확인하여 신규 회원 여부 판단
            // - 기존 회원인 경우 : Sign-In -> home
            // - 신규 회원인 경우 : Sign-In 후 Firestore에 uid 저장 -> 추가정보 수집
            
            guard let user = result?.user else { return }
            
            print("로그인된 유저 \(user.uid)")
            
            let docRef = Firestore.firestore().collection("users").document(user.uid)

            // Get data
            docRef.getDocument { (document, error) in
                guard let document = document, document.exists else {
                    // 신규회원
                    self.addNewUserToFirestore(userID: user.uid,loginWith: "google",user: user)
                    self.isLoading = false
                    self.didAuthenticateUser = true
                    return
                }
                // 기존회원인경우 바로 홈으로 이동
                self.userSession = user
            }
        }
        
        
        
    }
    
    // MARK: 구글로그인
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
                    
                    self.isLoading = true

                    if let error = err {
                        print("firebase로그인 에러"+error.localizedDescription)
                        self.isLoading = false
                        return
                    }
                     
                    // Users 컬렉션에 해당 uid 가 존재하는지 확인하여 신규 회원 여부 판단
                    // - 기존 회원인 경우 : Sign-In -> home
                    // - 신규 회원인 경우 : Sign-In 후 Firestore에 uid 저장 -> 추가정보 수집
                    
                    guard let user = result?.user else { return }
                    
                    print("로그인된 유저 \(user.uid)")
                    
                    let docRef = Firestore.firestore().collection("users").document(user.uid)

                    // Get data
                    docRef.getDocument { (document, error) in
                        guard let document = document, document.exists else {
                            // 신규회원
                            self.addNewUserToFirestore(userID: user.uid,loginWith: "google",user: user)
                            self.isLoading = false
                            self.didAuthenticateUser = true
                            return
                        }
                        // 기존회원인경우 바로 홈으로 이동
                        self.userSession = user
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: 신규유저DB추가
    // 새로 가입한 user의 UID 를 firestore에 등록하여 해당 정보를 db로 관리
    func addNewUserToFirestore(userID: String, loginWith: String, user: Firebase.User?) {
        
        // loginWith: Apple or Google
        
        let data = User(id: userID, userName: "", nickName: "", loginWith: loginWith, accountHolder: "", accountBank: "", accountNumber: "", spaceList: [], isAgreed: [])

        self.tempUserSession = user
        
        let docRef =  db.collection("users").document(userID)

        do {
            try docRef.setData(from: data)
            self.didAuthenticateUser = true
        }
        catch {
          print(error)
        }

    }
    
    // MARK: 신규유저추가정보업데이트
    // https://designcode.io/swiftui-advanced-handbook-write-to-firestore
    func updateNewUserData( data: User) {
        
        guard let user = tempUserSession else { return }
             
        // user 정보 업데이트
        let data = User(id: user.uid, userName: data.userName, nickName: data.nickName, loginWith: "google", accountHolder: data.accountHolder, accountBank: "default", accountNumber: data.accountNumber, spaceList: [], isAgreed: data.isAgreed)

        print("DEBUG: 업데이트 하려는 데이터 \(data)")
        
        let docRef =  db.collection("users").document(user.uid)

        do {
            try docRef.setData(from: data, merge: true)
            print("DEBUG: 사용자 추가 정보 입력이 성공적으로 ")
        }
        catch {
            print("DEBUG: 다음 이유로 사용자 추가 정보 입력에 에러가 발생했습니다 : \(error)")
        }
        
        self.userSession = Auth.auth().currentUser // main 페이지도 이동
        

    }
    
    /*
     // TODO: 닉네임 업데이트 오류 수정
    // MARK: 닉네임 업데이트
    // - "" : 기존회원인경우 현재 유저의 uid 로 업데이트 (XXX)
    // - userId : 새로운 유저는 tempuser의 uid를 받아와 추가
    func updateUserNickName(with newNickName: String) {

        guard let user = Auth.auth().currentUser else { return }
        let collectionRef = db.collection("users")

        // 사용자
//        struct User: Identifiable, Codable {// , Hashable
//            @DocumentID var id: String?
//            var userName: String // 사용자이름 - 간편로그인 연계
//            var nickName: String // 닉네임
//            var account: String // 계좌정보 Account 참조해야함. -> ID
//            var image: String = "default" // 우선 Default 로 하나로 통일 - "default"
//            var profileImage: Image {
//                Image(image)
//            }
//            var spaceList: [String] // 참가한 스페이스 리스트 String 참조해야함
//        }
        
        
        let data = ["id": user.id,
                    "userName": user.userName,
                    "nickName": user.newNickName,
                    "acount": accountViewModel.accountRef]

        // 2. 닉네임 업데이트
        collectionRef
            .document(user.id)
            .setData(data, merge: true){ error in
                            if let error = error {
                                print("DEBUG: 다음 이유로 사용자 추가 정보 입력에 에러가 발생했습니다 : \(error)")
                            } else {
                                print("DEBUG: 사용자 추가 정보 입력이 성공적으로 ")
                                self.userSession = self.tempUseㅁㄴㅂ rSession // main 페이지도 이동
                            }
                        }
    }
    */
    
    
    // MARK: 로그아웃
    func signOut() {
        // sets user session to nil so we show login view (only client side)
        userSession = nil
        
        // signs user out on server (backend)
        try? Auth.auth().signOut()
    }
    
    // MARK: 회원탈퇴
    func delete() {

        let user = Auth.auth().currentUser
        
        signOut()
     
        try? user?.delete { error in
          if let error = error {
            // An error happened.
              print("DEBUG: 회원탈퇴에 실패했습니다.\(error)")
          } else {
            // Account deleted.
              print("DEBUG: 성공적으로 탈퇴되었습니다.")
          }
        }
    }

}
