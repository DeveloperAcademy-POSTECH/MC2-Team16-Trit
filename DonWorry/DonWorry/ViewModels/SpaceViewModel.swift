//
//  SpaceViewModel.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/11.
//

import Foundation
import Firebase
import FirebaseFirestore

extension FireStoreViewModel {
       
    
    
//    func getAccountDatas() {
//        // get a reference to the database
//        let db = Firestore.firestore()
//        db.collection("Account").getDocuments { snapshot, error in
//
//            if error == nil {
//                if let snapshot = snapshot {
//
//                    DispatchQueue.main.async {
//                        self.accountList = snapshot.documents.map { d in
//                            return Account(id: d.documentID,
//                                           accountHolder: d["accountHolder"] as! String,
//                                           accountBank: d["accountBank"] as! String,
//                                           accountNumber: d["accountNumber"] as! String)
//                        }
//                    }
//                }
//            } else {
//                print("계좌 불러오기 실패")
//            }
//        }
//    }
    
    
    // 전체 스페이스 불러오기
    func getSpaceDatas() {
        // get a reference to the database
        let db = Firestore.firestore()
        db.collection("Space").getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.spaceList = snapshot.documents.map { d in
                            return Space(id: d.documentID,
                                         spaceID: d["spaceID"] as! String,
                                         spaceName: d["spaceName"] as! String,
                                         payment: d["payment"] as! [String],
                                         status: (d["status"] != nil),
                                         transfer: d["transfer"] as! [String],
                                         userList: d["userList"] as! [String],
                                         admin: d["admin"] as! String)
                        }
                    }
                }
            } else {
                print("스페이스 불러오기 실패")
            }
        }
    }
    
    // 스페이스 하나 불러오기
    // Space Document Id를 parameter로 받습니다.
    func getSpaceData(SpaceID: String) {
        let db = Firestore.firestore()
        let spaceRef = db.collection("Space").document(SpaceID)
        
        spaceRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("계좌 불러오기 실패")
            }
        }
    }
    
    // space 추가함수
    func addSpaceData(spaceName: String) {
        // get a reference to the database
        let db = Firestore.firestore()

        db.collection("Space").addDocument(data: [
                                                  "spaceID" : "",
                                                  "spaceName" : spaceName,
                                                  "payment" : [],
                                                  "status" : false,
                                                  "transfer" : [],
                                                  "userList" : [],
                                                  "admin" : ""
                                                 ]) { error in
            
            if error == nil {
                self.getSpaceDatas()
            } else {
                print("스페이스 추가하기 실패")
            }
        }
    }
    
    // spaceData 삭제
    func deleteSpaceData(spaceToDelete: Space) {

        let db = Firestore.firestore() // FireBase 데이터 베이스를 reference
        
        // collection에 접근
        db.collection("Space").document(spaceToDelete.id).delete { error in
            if error == nil {

                DispatchQueue.main.async {
                    self.spaceList.removeAll { space in
                        return space.id == spaceToDelete.id
                    }
                }

            } else {
                print("스페이스 삭제하기 실패")
            }
        }
    }
    
    
//    func updateAccount(AccountToUpdate: Account, newBank: String?) {
//
//        let db = Firestore.firestore()
//
//        db.collection("Account").document(AccountToUpdate.id).setData(["accountBank" : newBank ?? ""], merge: true) { error in
//
//            if error == nil {
//                self.getAccountDatas()
//            } else {
//                print("계좌 정보 업데이트 실패(은행)")
//            }
//        }
//    }
    
    func updateSpace(SpaceToUpdate: Space, newSpaceName: String?) {
        
        let db = Firestore.firestore()

        db.collection("Space").document(SpaceToUpdate.id).setData(["spaceName" : newSpaceName ?? ""], merge: true) { error in

            if error == nil {
                self.getSpaceDatas()
            } else {
                print("space이름 수정 실패")
            }
        }
    }
}
