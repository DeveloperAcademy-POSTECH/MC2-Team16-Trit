//
//  User.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI

// 사용자
struct User: Identifiable {// , Hashable
    var id = UUID()
    var userName: String // 사용자이름 - 간편로그인 연계
    var nickName: String // 닉네임
    var account: Account // 계좌정보
    var image: String = "default" // 우선 Default 로 하나로 통일 - "default"
    var profileImage: Image {
        Image(image)
    }
    var spaceList: [Space] // 참가한 스페이스 리스트
}

// assumption: 1차만 간 상황을 고려 참석자는 4명 돈을 받을 taker는 유쓰와 루미 돈을 보낼 giver는 애셔(루미에게) 버리(루미에게) 루미(유쓰에게)

//let user1: User = User(userName: "애셔", profileImage: "user1", giveMoney: 12000, giveTo: "루미", participant: "밤샘코딩")
//let user2: User = User(userName: "유쓰", profileImage: "user2", takeMoney: 12000, userAccount: "2346128947294우리은행", participant: "밤샘코딩")
//let user3: User = User(userName: "버리", profileImage: "user3", giveMoney: 18000, giveTo: "루미", participant: "밤샘코딩")
//let user4: User = User(userName: "루미", profileImage: "user4", takeMoney: 30000, giveMoney: 12000, giveTo: "유쓰", userAccount: "61630204093436국민", participant: "밤샘코딩")
//let users: [User] = [user1, user2, user3, user4]

var users: [User] = [
    User(userName: "의성",
         nickName: "Youth",
         account: Account(accountHolder: "의성",
                          accountBank: "토스뱅크",
                          accountNumber: "1111111111111111"),
         spaceList: spaces),
    
    User(userName: "영후", nickName: "Asher",
         account: Account(accountHolder: "영후",
                          accountBank: "우리은행",
                          accountNumber: "22222222222222"),
         spaceList: spaces),
    
    User(userName: "찬희",
         nickName: "Avery",
         account: Account(accountHolder: "찬희",
                          accountBank: "카카오뱅크",
                          accountNumber: "333333333333"),
         spaceList: spaces),
    
    User(userName: "승창",
         nickName: "Chalie",
         account: Account(accountHolder: "승창",
                          accountBank: "국민은행",
                          accountNumber: "4444444444444"),
         spaceList: spaces),
    
    User(userName: "한규",
         nickName: "Kyu",
         account: Account(accountHolder: "한규",
                          accountBank: "케이뱅크",
                          accountNumber: "5555555555555"),
         spaceList: spaces),
    
    User(userName: "영진",
         nickName: "lumi",
         account: Account(accountHolder: "영진",
                          accountBank: "신한은행",
                          accountNumber: "6666666666666"),
         spaceList: spaces)
]
