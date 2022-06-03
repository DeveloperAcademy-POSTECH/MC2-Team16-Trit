//
//  File.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import Foundation

struct User: Identifiable, Hashable {
    var id = UUID().uuidString
    var userName: String
    var profileImage: String
    var takeMoney: Int?
    var giveMoney: Int?
    var giveTo: String?
    var userAccount: String?
}
