//
//  FireStoreViewModel.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/10.
//

import Foundation
import Firebase
import FirebaseFirestore

class FireStoreViewModel: ObservableObject {

    @Published var userList = [User]()
    @Published var accountList = [Account]()
    @Published var spaceList = [Space]()
    @Published var space = Space.empty
    
    var spaceContainer = [String]()
    
    var resultSpace: Space = .empty
    var resultSpaces: [Space] = []
    
    let db = Firestore.firestore()
    
    
    // 현재 유저 불러오기 함수
    func getUserData() {
        // get a reference to the database
        let db = Firestore.firestore()
        db.collection("User").getDocuments { snapshot, error in
            if error == nil {

                if let snapshot = snapshot {

                    DispatchQueue.main.async {
                        self.userList = snapshot.documents.map { d in
                            return User(id: d.documentID,
                                        userName: d["userName"] as! String,
                                        nickName: d["ni ckName"] as! String,
                                        account: d["account"] as! String, // TODO: reference로 수정해야함
                                        image: d["image"] as! String,
                                        spaceList: d["spaceList"] as! [String]
                            )
                        }
                    }
                }

            } else {
                print("유저 불러오기 실패")
            }
        }
    }
    
//    func getUserData(AccountID: String) -> User {
//        let db = Firestore.firestore()
//        let accountRef = db.collection("Account").document(AccountID)
//
//        accountRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                return User(userName: document["userName"] as! String,
//                            nickName: document["nickName"] as! String,
//                            account: document["account"] as! String,
//                            spaceList: [])
//            } else {
//                print("계좌 불러오기 실패")
//            }
//        }
//    }
    
    // 유저 추가하기 함수
    // 사용방법
    // 1. User 구조체를 만들어 준다.
    // 2. addUserData(구조체변수) -> db에 데이터가 추가 됩니다.
    func addUserData(user: User) {
        let db = Firestore.firestore()

        db.collection("User").addDocument(data:["userName": user.userName,
                                                "nickName": user.nickName,
                                                "image": user.image,
                                                "account": user.account,
                                                "spaceList": user.spaceList]) { error in

            if error == nil {
                self.getUserData()
            } else {
                print("유저 추가하기 실패")
            }
        }
    }
    
    // 유저 삭제하기 함수
    func deleteUserData(userToDelete: User) {

        let db = Firestore.firestore() // FireBase 데이터 베이스를 reference
        
        // collection에 접근
        db.collection("User").document(userToDelete.id ?? "").delete { error in
            if error == nil {

                DispatchQueue.main.async {
                    self.userList.removeAll { user in
                        return user.id == userToDelete.id
                    }
                }

            } else {
                print("유저 삭제하기 실패")
            }
        }
    }

    // 유저 정보 업데이트의 예시로 이름 바꾸기를 선택!
    func updateUserName(userToUpdate: User, newName: String?) {

        let db = Firestore.firestore()

        db.collection("User").document(userToUpdate.id ?? "").setData(["userName" : newName ?? ""], merge: true) { error in

            if error == nil {
                self.getUserData()
            } else {
                print("유저 정보 업데이트 실패")
            }
        }
    }
    
    // MARK: 실제 사용할 함수
    func addUserInfo(user: User, nickname: String, accountHolder: String, accountNumber: String, accountBank: String) {
        
        let db = Firestore.firestore()
        
        //Account 추가
        self.addAccountData(accountHolder: accountHolder, accountBank: accountBank, accountNumber: accountNumber)
        
        let AccountRef = db.collection("Account").document().documentID
        
        // User nickname Update
        db.collection("User").document(user.id ?? "").setData(["nickName" : nickname], merge: true)
        // User에 Account Reference 추가하기
        db.collection("User").document(user.id ?? "").setData(["account" : AccountRef] , merge: true)
    }
}
