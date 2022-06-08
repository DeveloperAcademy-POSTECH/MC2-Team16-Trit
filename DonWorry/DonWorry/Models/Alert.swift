//
//  Alert.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/06.
//

import SwiftUI

struct Alert: Identifiable, Hashable {
    var id = UUID()
    var isReminder: Bool // true : 리마인더 /  false: 정산시작
    var spaceTitle: String // 정산 : space 의 이름
    var paymentTitle: String // 리마인더 : payment 의 이름
    var sender: String // 리마인더 : 알림을 보내는 사람
    var timestamp : Date // 알림을 보낸날짜 "yyyy-MM-dd HH:mm:ss"
}
/*
let alertList: [String: [Alert]] = [

    "2022-06-06": [Alert(isReminder: false, spaceTitle: "MC2-트라잇", paymentTitle: "", sender: "", timestamp: "2022-06-06 00:33:22".stringToDate() ?? Date())]
    
//    Alert(isReminder: false, spaceTitle: "MC2-트라잇", paymentTitle: "", sender: "", timestamp: "2022-06-06 03:33:00".stringToDate()),
//    Alert(isReminder: false, spaceTitle: "MC2-트라잇", paymentTitle: "", sender: "", timestamp: "2022-06-06 14:33:00".stringToDate()),
//    Alert(isReminder: false, spaceTitle: "MC1-문샷", paymentTitle: "", sender: "", timestamp: "2022-06-04 10:00:23".stringToDate())
]
*/
