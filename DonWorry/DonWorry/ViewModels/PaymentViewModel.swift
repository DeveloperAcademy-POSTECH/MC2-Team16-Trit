//
//  PaymentViewModel.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/15.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

class PaymentViewModel: ObservableObject {
    
    @Published var payment: Payment = .empty
    @Published var paymentList = [Payment]()
    @Published var errorMessage: String?
//    @EnvironmentObject var authViewModel: AuthViewModel -> 다른 뷰모델 불러쓰기
    
    private var db = Firestore.firestore()
        
    // MARK: 새로운 payment 추가
    // [param] to: spaceID, data: Payment
    func addPayment(spaceID: String, data: Payment ,user: User) {
        
        let spaceRef = db.collection("Space").document(spaceID)
        
        do {
            let result = try db.collection("Payment").addDocument(from: data) { error in
                if error != nil {
                    self.errorMessage = error?.localizedDescription
                    return
                }
            }
            
            let paymentID = result.documentID
            spaceRef.setData(["payment" : FieldValue.arrayUnion([paymentID])], merge: true)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: payment 이름 변경
    // [param] with:name , paymentID:
    func updatePaymentTitle(with: String, paymentID: String) {
        
        let paymentRef = db.collection("Payment").document(paymentID)
        
        paymentRef.setData(["paymentTitle" : with], merge: true) { error in
            if error != nil {
                self.errorMessage = error?.localizedDescription
                print(self.errorMessage)
            }
        }
    }
    
    // MARK: 정산금액변경
    // [param] with: amount
    func updatePaymentAmount(with: Int, paymentID: String) {
        let paymentRef = db.collection("Payment").document(paymentID)
        
        paymentRef.setData(["amount" : with], merge: true) { error in
            if error != nil {
                self.errorMessage = error?.localizedDescription
                print(self.errorMessage)
            }
        }
    }
    
    // MARK: 정산첨부파일변경
    // [param] with: AttachedFile리스트
    func updatePaymentAttached() {
        
    }
    
    // MARK: 현재유저가 정산들에 참가할때
    // [param] payment list 를 받아야함
    // 참석버튼 -> 참석할 카드 여러개 선택 -> 확인누르면 이 함수 실행
    func participateInPayment() {
        
    }
    
    // MARK: 정산 삭제
    // [param] paymentID
    func deletePayment() {
        
    }
    
    // MARK: 특정 스페이스에 대한 모든 정산 내역 fetch (실시간)
    // [param] of: spaceID
    func fetchPayments() {
        // snapshotlistener 로 실시간으로 들어야할듯
    }
    
    // MARK: 특정 payment 만 fetch (실시간)
    // [param] payment id: payment ID
    func fetchPayment(){
        // snapshotlistener 로 실시간으로 들어야할듯
    }
    
}
