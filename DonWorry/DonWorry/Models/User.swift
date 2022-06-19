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
    var loginWith: String // apple or google
    var accountHolder: String // 예금주
    var accountBank: String // 은행명
    var accountNumber: String // 계좌번호
    var image: String = "default" // 우선 Default 로 하나로 통일 - "default"
    var profileImage: Image {
        Image(image)
    }
    var spaceList: [String] // 참가한 스페이스 리스트 String 참조해야함
    var isAgreed: [Bool] // 약관 동의
}

// mock 데이터용
struct OldUser: Identifiable, Hashable {
    var id = UUID().uuidString
    var userName: String
    var profileImage: String
    var takeMoney: Int?
    var giveMoney: Int?
    var giveTo: String?
    var userAccount: String?
    var participant: String
}

extension User {
    static let empty = User(userName: "", nickName: "", loginWith: "google", accountHolder: "", accountBank: "", accountNumber: "", spaceList: [], isAgreed: [])
}


let users: [OldUser] = [user1, user2, user3, user4]

let user1: OldUser = OldUser(userName: "애셔", profileImage: "user1", giveMoney: 12000, giveTo: "루미", participant: "밤샘코딩")
let user2: OldUser = OldUser(userName: "루미", profileImage: "user4", takeMoney: 12000, userAccount: "2346128947294우리은행", participant: "밤샘코딩")
let user3: OldUser = OldUser(userName: "버리", profileImage: "user3", giveMoney: 18000, giveTo: "루미", participant: "밤샘코딩")
let user4: OldUser = OldUser(userName: "유쓰", profileImage: "youth", takeMoney: 30000, giveMoney: 12000, giveTo: "루미", userAccount: "61630204093436국민", participant: "밤샘코딩")

var mockspaces: [String] = ["123455", "23444", "32133"]


//var users: [OldUser] = [
//    OldUser(userName: "의성",
//         nickName: "Youth",
//         account: "123",
//         spaceList: mockspaces ),
//
//    OldUser(userName: "영후",
//         nickName: "Asher",
//         account: "123",
//         spaceList: mockspaces),
//
//    OldUser(userName: "찬희",
//         nickName: "Avery",
//         account: "123",
//         spaceList: mockspaces),
//
//    OldUser(userName: "승창",
//         nickName: "Chalie",
//         account: "123",
//         spaceList: mockspaces),
//
//    OldUser(userName: "한규",
//         nickName: "Kyu",
//         account: "123",
//         spaceList: mockspaces),
//
//    OldUser(userName: "영진",
//         nickName: "lumi",
//         account: "123",
//         spaceList: mockspaces)
//]
