//
//  SpaceViewModel.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/11.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class SpaceViewModel: ObservableObject {
      
//    @Published var userList = [User]()
//    @Published var accountList = [Account]()
    @Published var spaceList = [Space]()
    @Published var space = Space.empty
    
    var spaceContainer = [String]()
    
    var resultSpace: Space = .empty
    var resultSpaces: [Space] = []
    
    private var db = Firestore.firestore()
   
    // MARK: 스페이스 만들기
    // ???: addSpaceData랑 차이?
    func createSpace(withName: String, user: User) {
        
        let db = Firestore.firestore()
        
        let space = Space(spaceID: "", spaceName: withName, payment: [], status: false, transfer: [], userList: [user.id ?? "123"], admin: user.id ?? "123")

        do {
            let _ = try db.collection("Space").addDocument(from: space)
        } catch {
            print(error)
        }
    }
    
    // MARK: 스페이스 상세정보 불러오기
    func fetchSpaceDetail(of: String) {
        let spaceRef = db.collection("Space").document(of)
        
        spaceRef.getDocument(as: Space.self) { result in
            switch result {
            case .success(let space):
                self.space = space
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: 특정 스페이스에 참가자 추가
    func addParticipant(spaceID: String, user: User) {
        
        let spaceRef = Firestore.firestore().collection("Space").document(spaceID)
        let userRef = Firestore.firestore().collection("users").document(user.id ?? "")
        
        spaceRef.updateData(["userList" : FieldValue.arrayUnion([user.id])]) { error in
            if error != nil {
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    // MARK: 스페이스 데이터 삭제
    func deleteSpace(spaceID: String) {
        
        let spaceRef = db.collection("Space").document(spaceID)
        let userRef = db.collection("User").whereField("spaceList", arrayContainsAny: [spaceID])
        let transferRef = db.collection("Transfer").whereField("spaceID", isEqualTo: spaceID)
        
        spaceRef.delete { error in
            if let error = error {
                print("스페이스 삭제에 실패했습니다.\(error.localizedDescription)")
            }
        }
        
        userRef.getDocuments { (querysnapshot, error) in
            if let error = error {
                print("유저를 불러오는데 실패했습니다.")
            } else {
                for document in querysnapshot!.documents {
                    document.reference.updateData(["spaceList" : FieldValue.arrayRemove([spaceID])])
                }
            }
        }
        
        transferRef.getDocuments { (querysnapshot, error) in
            if let error = error {
                print("트랜스퍼를 불러오는데 실패했습니다.")
            } else {
                for document in querysnapshot!.documents {
                    document.reference.delete()
                }
            }
        }
    }
    
    func updateSpaceStatus(spaceID: String) {
        
        let spaceRef = db.collection("Space").document(spaceID)
        
        spaceRef.setData(["status" : true], merge: true) { error in
            if let error = error {
                print("스페이스 상태 바꾸기 실패")
                print(error.localizedDescription)
            }
        }
    }
    
    // 여기서부터 개인적으로 만듬
    
    // MARK: 유저가 속한 스페이스 불러오기 (비동기)
    func loadUserSpace(userID: String, completion: @escaping (Result<[String], Error>) -> Void) {
        
        let userRef = Firestore.firestore().collection("User").document(userID)
        var spaceContainer = [String]()
        
        userRef.getDocument { (document, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                completion(.failure(error!))
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    spaceContainer = data["spaceList"] as! [String]
                    completion(.success(spaceContainer))
                }
            }
        }
    }
    
    // MARK: 유저가 속한 스페이스 불러오기
    // 유저ID(INPUT) -> 해당 유저 스페이스 목록 반환
    func loadSpace(userID: String) {
        
        var tempSpace: Space = .empty
        var resultSpaces: [Space] = []
        
        self.loadUserSpace(userID: userID) {
            switch $0 {
            case .success(let spaceContainer):
                for item in spaceContainer {

                    let spaceRef = Firestore.firestore().collection("Space").document(item)

                    spaceRef.getDocument { (document, error) in
                        if let error = error as NSError? {
                            print("Error : \(error.localizedDescription)")
                        } else {
                            if let document = document {
                                do {
                                    tempSpace = try document.data(as: Space.self)
                                    DispatchQueue.main.async {
                                        self.resultSpaces.append(tempSpace)
                                    }

                                } catch {
                                    print(error)
                                }
                            }
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
            print(self.resultSpaces)
        }
        
    }
    
    // MARK: 특정 스페이스 불러오기 (비동기)
    // 스페이스아이디(INPUT) -> Space구조체 (비동기 처리)
    func fetchAsyncSpace(documentID: String, completion: @escaping (Result<Space, Error>) -> Void) {
        let spaceRef = Firestore.firestore().collection("Space").document(documentID)
        var space: Space = .empty
        
        spaceRef.getDocument { (document, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                completion(.failure(error!))
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if data != nil {
                    do {
                        space = try document.data(as: Space.self)
                        print("1", space)
                    } catch {
                        print(error.localizedDescription)
                        return
                    }
                    completion(.success(space))
                }
            }
        }
    }
    
    // MARK: 스페이스 불러오기
    // spaceID(INPUT)->비동기처리한 space 불러오기
    func fetchSpace(documentID: String) {
        
        self.fetchAsyncSpace(documentID: documentID) {
            switch $0 {
            case .success(let space):
                print(space)
                self.resultSpace = space
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: 전체 스페이스 불러오기
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
    
    // MARK: spaceData 삭제
    func deleteSpaceData(spaceToDelete: Space) {

        let db = Firestore.firestore() // FireBase 데이터 베이스를 reference
        
        // collection에 접근
        db.collection("Space").document(spaceToDelete.id ?? "").delete { error in
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
    
    // MARK: space 참가
    func updateSpace(SpaceToUpdate: Space, newSpaceName: String?) {
        
        let db = Firestore.firestore()

        db.collection("Space").document(SpaceToUpdate.id ?? "").setData(["spaceName" : newSpaceName ?? ""], merge: true) { error in

            if error == nil {
                self.getSpaceDatas()
            } else {
                print("space이름 수정 실패")
            }
        }
    }
    
    // MARK: 특정 Space 정보 가져오기
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
    
    // MARK: Space에 데이터 더하기
    // ???: createSpace랑 차이?
    func addSpaceData(spaceName: String) {
        // get a reference to the database
        let db = Firestore.firestore()

        let data = ["spaceID" : "",
                    "spaceName" : spaceName,
                    "payment" : [],
                    "status" : false,
                    "transfer" : [],
                    "userList" : [],
                    "admin" : ""] as [String : Any]
        
        db.collection("Space").addDocument(data: data) { error in
            
            if error == nil {
                self.getSpaceDatas()
            } else {
                print("스페이스 추가하기 실패")
            }
        }
    }
}
