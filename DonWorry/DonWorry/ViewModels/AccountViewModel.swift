//
//  AccViewModel.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/15.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

class AccountViewModel: ObservableObject {
    
    @Published var account: Account = .empty
    @Published var accountRef: String?
    @Published var errorMessage: String?
    @EnvironmentObject var authViewModel: AuthViewModel
    
    private var db = Firestore.firestore()
    
    init() {
//        account = self.fetchAccount(userId: Auth.auth().currentUser)

    }
    
    private func fetchAccount(userId: String) {
        
        let docRef = db.collection("accounts").document(userId)
        
        docRef.getDocument(as: Account.self) { result in
            switch result {
            case .success(let account):
                self.account = account
                self.errorMessage = nil
            case .failure(let error):
                switch error {
                case DecodingError.typeMismatch(_, let context):
                    self.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
                case DecodingError.valueNotFound(_, let context):
                    self.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
                case DecodingError.keyNotFound(_, let context):
                    self.errorMessage = "\(error.localizedDescription): \(context.debugDescription)"
                case DecodingError.dataCorrupted(let key):
                    self.errorMessage = "\(error.localizedDescription): \(key)"
                default:
                    self.errorMessage = "DEBUG: Error decoding document: \(error.localizedDescription)"
                }
            }
        }   
    }
    
    // MARK: 계좌정보 추가
    // - "" : 기존회원인경우 현재 유저의 uid 로 추가
    // - userId : 새로운 유저는 tempuser의 uid를 받아와 추가 
//    func addAccount(account: Account, to userId: String = "") {
//
//        guard let user = Auth.auth().currentUser else { return }
//        let uid = (userId != "") ? userId : user.uid
//        let collectionRef = db.collection("accounts")
//
//        let data = ["uid": uid,
//                    "accountHolder": account.accountHolder,
//                    "accountBank": account.accountBank,
//                    "accountNumber": account.accountNumber]
//
//        let newDocReference = try collectionRef.document(user.uid).setData(data, merge: true)
//
//        print("DEBUG: 새로운 계좌정보가 생성되었습니다. \(newDocReference)")
//
//        // account 정보 return
//        accountRef = newDocReference
//
//    }
    
    // MARK: 계좌상세정보 불러오기
    // - () 현재 사용자의 계좌정보
    // - (of userid:) 특정 사용자의 계좌번호
    func getAccountDetail(of userId: String = "") {
        if userId == "" {
            if let currentUser = authViewModel.currentUser.id {
                fetchAccount(userId: currentUser)
            }else{
                print("DEBUG: 현재유저를 알수없습니다. USER - \(userId)")
            }
        }
        else {
            fetchAccount(userId: userId)
        }
    }
    
    // MARK: 계좌정보 수정
    func updateAccount(account: Account) {
        if let id = account.id {
            let docRef = db.collection("accounts").document(id)
            do {
                try docRef.setData(from: account)
            }
            catch {
                print(error)
            }
        }
    }
    
    // MARK: 계좌정보 삭제
    func deleteAccount(account: Account) {
        
        if let id = account.id {
            let docRef = db.collection("accounts").document(id)
            do {
                try docRef.delete()
            }
            catch {
                print(error)
            }
        }
    }
    
}
