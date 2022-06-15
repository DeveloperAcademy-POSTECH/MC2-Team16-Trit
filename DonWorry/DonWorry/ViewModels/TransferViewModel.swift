//
//  TransferViewModel.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/15.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

class TransferViewModel: ObservableObject {
    
    @Published var transfer: TransferModel = .empty
    @Published var transferList = [TransferModel]()
    @Published var errorMessage: String?
//    @EnvironmentObject var authViewModel: AuthViewModel -> 다른 뷰 불러쓰기
    
    private var db = Firestore.firestore()
    
    private func fetchT(userId: String) {
        
    }
    
    // MARK: 내가 속한 스페이스의 transfer 목록 부르기
    // params
    // > from: spaceId (내가속한스페이스의ID)
    func fetchTransferList() {
        // 1. fetch 해서
        // 2. transferList 설정
    }
    
    // MARK: 내가 속한 특정 스페이스에 대한 받을 돈 목록
    // params
    // > from: spaceId (내가속한스페이스의ID)
    func fetchTakingList() {
        // 1. fetch 해서
        // 2. transferList 설정
    }
    
    /* TODO: 구현하기 ( parma 없이 이름 겹쳐서 주석)
    // MARK: 내가 받을 돈 목록 (스페이스 상관X)
    func fetchTakingList() {
        // 1. fetch 해서
        // 2. transferList 설정
    }
     */
    
    
    // MARK: 내가 속한 특정 스페이스에 대한 줄 돈 목록
    // params
    // > from: spaceId (내가속한스페이스의ID)
    func fetchGivingList() {
        // 1. fetch 해서
        // 2. transferList 설정
    }

    /* TODO: 구현하기 ( parma 없이 이름 겹쳐서 주석)
    // MARK: 내가 줄 돈 목록 (스페이스 상관X)
    func fetchGivingList() {
        // 1. fetch 해서
        // 2. transferList 설정
    }
     */
    
    
    // MARK: 송금완료처리
    // parmas
    // > transferID: transferID (송금완료시키려는 tranfer의 ID)
    func setTransferCompleted() {
        
        /*
        let docRef = db.collection(트랜스퍼).document(트랜스퍼아이디)
        do {
            try docRef.setData(isCompleted 를 바꾸는 코드 )
        }
        catch {
            print(error)
        }
         */

    }
    
}
