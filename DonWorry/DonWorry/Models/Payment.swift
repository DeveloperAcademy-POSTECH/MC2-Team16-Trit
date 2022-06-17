//
//  Payment.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import FirebaseFirestoreSwift
import Foundation

// 각 정산 내역 (Card)
struct Payment: Identifiable, Codable { // Hashable
    @DocumentID var id : String?
    var spaceID: String
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

extension Payment {
    static let empty = Payment(spaceID: "" ,paymentTitle: "", category: "", amount: 0, color: "", date: "", attachedFile: [], givers: [], taker: "", account: [])
}


var mockUsers = ["Lumi", "Asher", "charlie"]

var payments: [Payment] = [
    Payment(spaceID: "",
            paymentTitle: "1차 고기집",
            category: "chicken",
            amount: 130000,
            color: "red",
            date: "6월9일",
            attachedFile: [],
            givers: mockUsers,
            taker: mockUsers[0],
            account: ["카카오뱅크", "김승창", "1234-1231234-123"]),
    
    Payment(spaceID: "",
            paymentTitle: "2차 횟집",
            category: "fish",
            amount: 118000,
            color: "blue",
            date: "6월9일",
            attachedFile: [],
            givers: mockUsers,
            taker: mockUsers[0],
            account: ["카카오뱅크", "김승창", "1234-1231234-123"]),

    Payment(spaceID: "",
            paymentTitle: "3차 뼈찜",
            category: "bone",
            amount: 87000,
            color: "brown",
            date: "6월10일",
            attachedFile: [],
            givers: mockUsers,
            taker: mockUsers[0],
            account: ["카카오뱅크", "김승창", "1234-1231234-123"])
]
