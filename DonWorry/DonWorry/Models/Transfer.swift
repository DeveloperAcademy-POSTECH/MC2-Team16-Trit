//
//  Transfer.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import Foundation
import FirebaseFirestoreSwift

// 커스텀 타입
struct Transfers : Identifiable, Codable{
    @DocumentID var id : String?
    var giver: String // 보내는 사람
    var taker: String // 받는 사람
    var amount: Int // 금액
    var isCompleted: Bool = false // 송금완료 여부
}

extension Transfers {
    static let empty = Transfers(id: "", giver: "", taker: "", amount: 30000)
}

struct Transfer {
    var giver: User
    var taker: User
    var amount: Int
    var isCompleted: Bool = false
}

var transfers: [Transfer] = [
    Transfer(giver: users[3], taker: users[1], amount: 72734),
    Transfer(giver: users[5], taker: users[1], amount: 5718),
    Transfer(giver: users[5], taker: users[0], amount: 62980),
    Transfer(giver: users[4], taker: users[0], amount: 23432),
    Transfer(giver: users[4], taker: users[2], amount: 19984)
]

// currentUser한테 돈을 줘야할 user의 리스트
func makeGiverList(trnasfers: [Transfer], currentUser: User) -> [Transfer] {
    var giverTransferList: [Transfer] = []
    transfers.forEach {
        if $0.taker.userName == currentUser.userName {
            giverTransferList.append($0)
        }
    }
    return giverTransferList
    // 예상결과 : contentUser = users[0]일떄 giverTransferList = [transfer[2], transfer[3]]
}

// currentUser가 돈을 줘야할 user의 리스트
func makeTakerList(trnasfers: [Transfer], currentUser: User) -> [Transfer] {
    var takerTransferList: [Transfer] = []
    transfers.forEach {
        if $0.giver.userName == currentUser.userName {
            takerTransferList.append($0)
        }
    }
    return takerTransferList
    // 예상결과 : contentUser = users[0]일때 takerTransferList = []
}

// currentUser한테 돈을 줘야할 user의 DisplayList
// card에는 profile image가 최대 4개만
func makeDisplayGiverList(makeGiverList: [Transfer]) -> [String] {
    var giverProfileImage: [String] = []
    if makeGiverList.count > 3 {
        makeGiverList[0..<4].forEach {
            giverProfileImage.append($0.giver.image)
        }
    } else {
        makeGiverList.forEach {
            giverProfileImage.append($0.giver.image)
        }
    }
    return giverProfileImage
}
