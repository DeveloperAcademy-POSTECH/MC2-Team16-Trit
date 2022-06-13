//
//  AccountViewModel.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/10.
//

import Foundation
import Firebase
import FirebaseFirestore

extension FireStoreViewModel {
    
    // Read Account
    func getAccountDatas() {
        // get a reference to the database
        let db = Firestore.firestore()
        db.collection("Account").getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.accountList = snapshot.documents.map { d in
                            return Account(id: d.documentID,
                                           accountHolder: d["accountHolder"] as! String,
                                           accountBank: d["accountBank"] as! String,
                                           accountNumber: d["accountNumber"] as! String)
                        }
                    }
                }
            } else {
                print("계좌 불러오기 실패")
            }
        }
    }
    
    // id로 해당 account document만 출력!
    // 수정중 -> 아직 작업 중
    func getAccountData(AccountID: String) {
        let db = Firestore.firestore()
        let accountRef = db.collection("Account").document(AccountID)
        
        accountRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("계좌 불러오기 실패")
            }
        }
    }
    
    // Create Account
    // Account 추가함수
    func addAccountData(accountHolder: String, accountBank: String, accountNumber: String) {
        // get a reference to the database
        let db = Firestore.firestore()

        db.collection("Account").addDocument(data: ["accountHolder": accountHolder,
                                                    "accountBank": accountBank,
                                                    "accountNumber": accountNumber]) { error in
            
            if error == nil {
                self.getAccountDatas()
            } else {
                print("계좌 추가하기 실패")
            }
        }
    }
    
    // Delete Account
    // Account 삭제 함수
    func deleteAccountData(userToDelete: User) {

        let db = Firestore.firestore() // FireBase 데이터 베이스를 reference
        
        // collection에 접근
        db.collection("User").document(userToDelete.uid).delete { error in
            if error == nil {

                DispatchQueue.main.async {
                    self.userList.removeAll { user in
                        return user.id == userToDelete.uid
                    }
                }

            } else {
                print("유저 삭제하기 실패")
            }
        }
    }

    // Update Account
    // 예금주명 수정 함수
    func updateAccount(AccountToUpdate: Account, newHolder: String) {

        let db = Firestore.firestore()

        db.collection("Account").document(AccountToUpdate.id).setData(["accountHolder" : newHolder], merge: true) { error in

            if error == nil {
                self.getAccountDatas()
            } else {
                print("계좌 정보 업데이트 실패(예금주)")
            }
        }
    }
    
    // 은행 수정 함수
    func updateAccount(AccountToUpdate: Account, newBank: String) {
        
        let db = Firestore.firestore()

        db.collection("Account").document(AccountToUpdate.id).setData(["accountBank" : newBank], merge: true) { error in

            if error == nil {
                self.getAccountDatas()
            } else {
                print("계좌 정보 업데이트 실패(은행)")
            }
        }
    }
    
    // 계좌번호 수정 함수
    func updateAccount(AccountToUpdate: Account, newNumber: String) {
        
        let db = Firestore.firestore()

        db.collection("Account").document(AccountToUpdate.id).setData(["accounNumber" : newNumber], merge: true) { error in

            if error == nil {
                self.getAccountDatas()
            } else {
                print("계좌 정보 업데이트 실패(계좌번호)")
            }
        }
    }
}
