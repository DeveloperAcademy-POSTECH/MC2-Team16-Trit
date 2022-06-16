//
//  Pasteboard.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/16.
//

import SwiftUI

let pasteboard = UIPasteboard.general

func copyToPasteboard(_ text: String) {
    pasteboard.string = text
}
