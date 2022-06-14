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
    @Published var errorMessage: String?
    @EnvironmentObject var authViewModel: AuthViewModel
    
    private var db = Firestore.firestore()
    
    
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
                self.errorMessage = "Error decoding document: \(error.localizedDescription)"
              }
            }
        }
        
    }
    
    
    // MARK: 계좌정보추가
    func addAccount() {
        let collectionRef = db.collection("accounts")
        do {
            let newDocReference = try collectionRef.addDocument(from: self.account)
            print("Account stored with new document reference: \(newDocReference)")
        }
        catch {
            print(error)
        }
    }
    
    
    // MARK: getAccountDetail
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
        else{
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

