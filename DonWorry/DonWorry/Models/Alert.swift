//
//  Alert.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/06.
//

import SwiftUI

// 알림
// struct Alert: Identifiable, Hashable {
//     var id = UUID()
//     var isReminder: Bool // true : 리마인더 /  false: 정산시작
//     var spaceTitle: String // 정산 : space 의 이름
//     var paymentTitle: String // 리마인더 : payment 의 이름
//     var sender: String // 리마인더 : 알림을 보내는 사람
//     var timestamp: Date // 알림을 보낸날짜 "yyyy-MM-dd HH:mm:ss"
// }

struct Alert: Identifiable, Hashable {
    var id = UUID()
    var isReminder: Bool // true : 리마인더 /  false: 정산시작
    var spaceTitle: String // 정산 : space 의 이름
    var paymentTitle: String // 리마인더 : payment 의 이름
    var sender: String // 리마인더 : 알림을 보내는 사람
    var timestamp : Date // 알림을 보낸날짜 "yyyy-MM-dd HH:mm:ss"
}
