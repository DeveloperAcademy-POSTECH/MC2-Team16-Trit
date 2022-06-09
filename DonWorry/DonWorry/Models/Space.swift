//
//  Space.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import Foundation

// 각 스페이스 정보
struct Space: Identifiable { //Hashable
    var id = UUID().uuidString
    var spaceID: String // 간소화된 참가용 스페이스 ID
    var spaceName: String // 스페이스 이름
    var payment: [Payment] // 정산내역 (CARD) 리스트
    var status: Bool // 참석완료여부
    var transfer: [Transfer] // 송금필요내역
    var userList: [User] //참가자 리스트
    var admin: User // Space 주인 
}

var spaces: [Space] = [
    Space(spaceID: "17391798749", spaceName: "트라잇회식", payment: payments, status: true, transfer: transfers, userList: users, admin: users[0])
]
