//
//  User.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import Foundation

struct User: Identifiable, Hashable {
    var id = UUID().uuidString
    var userName: String
    var profileImage: String
    var takeMoney: Int?
    var giveMoney: Int?
    var giveTo: String?
    var userAccount: String?
    var participant: String
}

// assumption: 1차만 간 상황을 고려 참석자는 4명 돈을 받을 taker는 유쓰와 루미 돈을 보낼 giver는 애셔(루미에게) 버리(루미에게) 루미(유쓰에게)

let user1: User = User(userName: "애셔", profileImage: "user1", giveMoney: 12000, giveTo: "루미", participant: "밤샘코딩")
let user2: User = User(userName: "유쓰", profileImage: "user2", takeMoney: 12000, userAccount: "2346128947294우리은행", participant: "밤샘코딩")
let user3: User = User(userName: "버리", profileImage: "user3", giveMoney: 18000, giveTo: "루미", participant: "밤샘코딩")
let user4: User = User(userName: "루미", profileImage: "user4", takeMoney: 30000, giveMoney: 12000, giveTo: "유쓰", userAccount: "61630204093436국민", participant: "밤샘코딩")
let users: [User] = [user1, user2, user3, user4]
