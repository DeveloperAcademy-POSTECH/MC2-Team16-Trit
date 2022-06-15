////
////  FireStoreViewModel.swift
////  DonWorry
////
////  Created by YeongJin Jeong on 2022/06/10.
////
//
//import Foundation
//import Firebase
//import FirebaseFirestore
//
//class FireStoreViewModel: ObservableObject {
//
//    @Published var userList = [User]()
//    @Published var accountList = [Account]()
//    @Published var spaceList = [Space]()
//
////    // 유저 삭제하기 함수
//    // 회원 탈퇴! / firestore 삭제 , autehnticate 삭제
//    func deleteUserData(userToDelete: User) {
//
//        let db = Firestore.firestore() // FireBase 데이터 베이스를 reference
//
//        // collection에 접근
//        db.collection("User").document(userToDelete.id).delete { error in
//            if error == nil {
//
//                DispatchQueue.main.async {
//                    self.userList.removeAll { user in
//                        return user.id == userToDelete.id
//                    }
//                }
//
//            } else {
//                print("유저 삭제하기 실패")
//            }
//        }
//    }
//
//    // 유저 추가하기 함수
//    // 사용방법
//    // 1. User 구조체를 만들어 준다.
//    // 2. addUserData(구조체변수) -> db에 데이터가 추가 됩니다.
//    // 중복 -> 삭제
//    func addUserData(user: User) {
//        let db = Firestore.firestore()
//
//        db.collection("User").addDocument(data:["userName": user.userName,
//                                                "nickName": user.nickName,
//                                                "image": user.image,
//                                                "account": user.account,
//                                                "spaceList": user.spaceList]) { error in
//
//            if error == nil {
//                self.getUserData()
//            } else {
//                print("유저 추가하기 실패")
//            }
//        }
//    }
//
//    // 현재 유저 불러오기 함수
//    // 전체유저불러옴
//    // getUsers
//    func getUserData() {
//        // get a reference to the database
//        let db = Firestore.firestore()
//        db.collection("User").getDocuments { snapshot, error in
//            if error == nil {
//
//                if let snapshot = snapshot {
//
//                    DispatchQueue.main.async {
//                        self.userList = snapshot.documents.map { d in
//                            return User(id: d.documentID,
//                                        userName: d["userName"] as! String,
//                                        nickName: d["nickName"] as! String,
//                                        account: d["account"] as! String, // TODO: reference로 수정해야함
//                                        image: d["image"] as! String,
//                                        spaceList: d["spaceList"] as! [String]
//                            )
//                        }
//                    }
//                }
//
//            } else {
//                print("유저 불러오기 실패")
//            }
//        }
//    }
//
//    // 유저 정보 업데이트의 예시로 이름 바꾸기를 선택!
//    func updateUserName(userToUpdate: User, newName: String?) {
//
//        let db = Firestore.firestore()
//
//        if let id = userToUpdate.id {
//            let docRef = db.collection("users").document(id)
//            do {
//              try docRef.setData(["userName" : newName ?? ""], merge: true)
//            }
//            catch {
//                print("유저 정보 업데이트 실패")
//            }
//        }
//    }
//
//
//
//}
