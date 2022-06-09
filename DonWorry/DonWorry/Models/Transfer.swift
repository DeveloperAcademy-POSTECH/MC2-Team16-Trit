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
    Transfer(giver: users[0], taker: users[1], amount: 12000),
    Transfer(giver: users[1], taker: users[2], amount: 19000),
    Transfer(giver: users[3], taker: users[2], amount: 24000)
]
