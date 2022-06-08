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
