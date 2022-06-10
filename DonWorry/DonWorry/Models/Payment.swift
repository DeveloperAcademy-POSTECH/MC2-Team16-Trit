//
//  Payment.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import Foundation

// 각 정산 내역 (Card)
struct Payment: Identifiable { // Hashable
    var id = UUID().uuidString
    var paymentTitle: String // 정산내역이름
    var category: String // icon
    var amount: Int // 정산 금액
    var color: String // 카드 색상
    var date: String // 정산일자
    var attachedFile: [String] // 첨부파일 - URL 배열
    var givers: [String] // 보내는 사람 리스트 *User 참조해야함*
    var taker: String // 받는 사람 *User 참조해야함*
    var account: [String] // 계좌정보 *Account 참조해야함*
}

var mockUsers = ["Lumi", "Asher", "charlie"]

var payments: [Payment] = [
    Payment(paymentTitle: "1차 고기집",
            category: "chicken",
            amount: 130000,
            color: "red",
            date: "6월9일",
            attachedFile: [],
            givers: mockUsers,
            taker: mockUsers[0],
            account: [users[0].account]),
    
    Payment(paymentTitle: "2차 횟집",
            category: "fish",
            amount: 118000,
            color: "blue",
            date: "6월9일",
            attachedFile: [],
            givers: mockUsers,
            taker: mockUsers[0],
            account: [users[1].account]),
    
    Payment(paymentTitle: "3차 뼈찜",
            category: "bone",
            amount: 87000,
            color: "brown",
            date: "6월10일",
            attachedFile: [],
            givers: mockUsers,
            taker: mockUsers[0],
            account: [users[2].account])
]
