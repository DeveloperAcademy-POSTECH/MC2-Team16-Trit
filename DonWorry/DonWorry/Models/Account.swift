//
//  Account.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import Foundation
import FirebaseFirestoreSwift

// 커스텀 타입 - 계좌정보
struct Account: Identifiable, Codable {
    @DocumentID var id: String?
    var userID: String
    var accountHolder: String // 예금주
    var accountBank: String // 은행명
    var accountNumber: String // 계좌번호
}

extension Account {
    static let empty = Account(userID: "",accountHolder: "", accountBank: "", accountNumber: "")
}
