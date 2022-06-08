//
//  Payment.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import Foundation

// 각 정산 내역 (Card)
struct Payment: Identifiable { //, Hashable
    var id = UUID().uuidString
    var paymentTitle: String //정산내역이름
    var category: String //icon
    var amount: Int // 정산 금액
    var color: String // 카드 색상
    var date: String // 정산일자
    var attachedFile: [String] // 첨부파일 - URL 배열
    var givers: [User] // 보내는 사람 리스트
    var taker: User // 받는 사람
    var account: [Account] // 계좌정보
}

