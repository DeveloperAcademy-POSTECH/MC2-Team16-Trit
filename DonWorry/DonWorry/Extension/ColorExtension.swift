//
//  File.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI

extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    /*
    CUSTOMIZED COLOR
    // 1. HEX 사용법
    static let grayC5 = Color(hex: "#c5c5c5")
    // 2. UIColor 사용법
    static let background = Color(UIColor.systemBlue)
    // 3. 시스템 이름으로 된 컬러 사용법
    static let bieberPeach = Color("peach")
    // 4. 프라이머리 컬러에 오퍼시티까지 !
    static let primaryShadoe = Color.primary.opacity(0.2)
     */
    
    // ADVENT COLOR
    static let blueMain = Color(hex: "#1C6BFF")
    static let grayC5 = Color(hex: "#c5c5c5")
    static let gray81 = Color(hex: "#818181")
    static let gray31 = Color(hex: "#313131")
    static let gray75 = Color(hex: "#757575")
    static let gray4E = Color(hex: "#4E4E4E")
    static let grayEF = Color(hex: "#EFEFEF")
    static let grayEE = Color(hex: "#EEEEEE")
    static let grayD0 = Color(hex: "#D0D0D0")
    static let grayBC = Color(hex: "#BCBCBC")
    static let grayD8 = Color(hex: "#D8D8D8")
    static let grayF2F3F5 = Color(hex: "#F2F3F5")
    static let blueCardCenter = Color(hex: "#0071ED")
    static let cardColor1 = Color(hex: "#401811")
    
}
