//
//  TermModel.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/03.
//

import Foundation

struct Term: Hashable {
    let title: String
    let content: String
    let isEssential: Bool
    var isChecked: Bool
    var showContent: Bool
}
