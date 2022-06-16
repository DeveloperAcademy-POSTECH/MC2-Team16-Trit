//
//  Space.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import FirebaseFirestoreSwift
import Foundation

// 각 스페이스 정보
struct Space: Identifiable, Codable { // Hashable
    @DocumentID var id : String?
    var spaceID: String // 간소화된 참가용 스페이스 ID
    var spaceName: String // 스페이스 이름
    var payment: [String] // 정산내역 (CARD) 리스트 *Payment참조해야함*
    var status: Bool // 참석완료여부
    var transfer: [String] // 송금필요내역 *Transfer 참조해야함*
    var userList: [String] // 참가자 리스트 *User 참조해야함*
    var admin: String // Space 주인 *User 참조해야함*
}

extension Space {
    static let empty = Space(spaceID: "", spaceName: "", payment: [], status: false, transfer: [], userList: [], admin: "")
}

var spaces: [Space] = [
    Space(spaceID: "17391798749",
          spaceName: "떱떱해",
          payment: ["hello"],
          status: true,
          transfer: ["1","2"],
          userList: ["ds","dwdw","Dwsd"],
          admin: "lumi"
         )
]


// switches -> 나중에 space list 불러와서 바꾸기!
var switches = ["MC2 트라잇 모임", "MC2 번개모임", "밤샘코딩", "떱떱해모임"]
