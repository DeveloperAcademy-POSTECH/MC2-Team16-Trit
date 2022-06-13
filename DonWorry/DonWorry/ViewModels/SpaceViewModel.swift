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
       
    // 전체 스페이스 불러오기
    // Read Account
    func getSpaceDatas() {
        // get a reference to the database
        let db = Firestore.firestore()
        db.collection("Space").getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.spaceList = snapshot.documents.map { d in
                            return Space(id: d["id"] as! String,
                                         spaceID: d["spaceID"] as! String,
                                         spaceName: d["spaceName"] as! String,
                                         payment: d["payment"] as! [String],
                                         status: (d["status"] != nil),
                                         transfer: d["trasfer"] as! [String],
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
    
    //    struct Space: Identifiable { // Hashable
    //        var id = UUID().uuidString
    //        var spaceID: String // 간소화된 참가용 스페이스 ID
    //        var spaceName: String // 스페이스 이름
    //        var payment: [String] // 정산내역 (CARD) 리스트 *Payment참조해야함*
    //        var status: Bool // 참석완료여부
    //        var transfer: [String] // 송금필요내역 *Transfer 참조해야함*
    //        var userList: [String] // 참가자 리스트 *User 참조해야함*
    //        var admin: String // Space 주인 *User 참조해야함*
    //    }
     
    
    // Create Account
    // space 추가함수
    func addSpaceData(spaceName: String) {
        // get a reference to the database
        let db = Firestore.firestore()

        db.collection("Space").addDocument(data: [
                                                  "spaceName" : spaceName,
                                                  "payment" : [],
                                                  "status" : false,
                                                  "transfer" : [],
                                                  "userList" : [],
                                                  "admin" : [],
                                                 ]) { error in
            
            if error == nil {
                self.getAccountDatas()
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
}
