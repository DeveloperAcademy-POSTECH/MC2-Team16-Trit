//
//  User.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI
import FirebaseFirestoreSwift

// 사용자
struct User: Identifiable, Codable {// , Hashable
    @DocumentID var id: String?
    var userName: String // 사용자이름 - 간편로그인 연계
    var nickName: String // 닉네임
    var account: String // 계좌정보 Account 참조해야함. -> ID
    var image: String = "default" // 우선 Default 로 하나로 통일 - "default"
    var profileImage: Image {
        Image(image)
    }
    var spaceList: [String] // 참가한 스페이스 리스트 String 참조해야함
}

extension User {
  static let empty = User(userName: "", nickName: "", account: "", image: "", spaceList: [])
}

var mockspaces: [String] = ["123455", "23444", "32133"]

var users: [User] = [
    User(userName: "의성",
         nickName: "Youth",
         account: "123",
         spaceList: mockspaces ),
    
    User(userName: "영후", nickName: "Asher",
         account: "123",
         spaceList: mockspaces),
    
    User(userName: "찬희",
         nickName: "Avery",
         account: "123",
         spaceList: mockspaces),
    
    User(userName: "승창",
         nickName: "Chalie",
         account: "123",
         spaceList: mockspaces),
    
    User(userName: "한규",
         nickName: "Kyu",
         account: "123",
         spaceList: mockspaces),
    
    User(userName: "영진",
         nickName: "lumi",
         account: "123",
         spaceList: mockspaces)
]
