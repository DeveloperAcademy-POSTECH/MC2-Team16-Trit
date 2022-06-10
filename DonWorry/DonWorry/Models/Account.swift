//
//  Account.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import Foundation

// 커스텀 타입 - 계좌정보
struct Account: Identifiable {
    var id = UUID().uuidString
    var accountHolder: String // 예금주
    var accountBank: String // 은행명
    var accountNumber: String // 계좌번호
}
