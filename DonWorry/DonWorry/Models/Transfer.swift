//
//  Transfer.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import Foundation

// 커스텀 타입
struct Transfer {
    var giver: User //보내는 사람
    var taker: User // 받는 사람
    var amount: Int // 금액
    var isCompleted: Bool = false // 송금완료 여부
}

var transfers: [Transfer] = [
    Transfer(giver: users[3], taker: users[1], amount: 72734),
    Transfer(giver: users[5], taker: users[1], amount: 5718),
    Transfer(giver: users[5], taker: users[0], amount: 62980),
    Transfer(giver: users[4], taker: users[0], amount: 23432),
    Transfer(giver: users[4], taker: users[2], amount: 19984)
]
