//
//  TextExtension.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/06.
//

import Foundation
import SwiftUI

extension Text {
    // 텍스트가 몇줄로 표현될 것인지, 글자 크기, weight, 글자색 을 정합니다.
    func applyTextWithLineLimitModifier(lineLimit: Int = 1, size: CGFloat, weight: Font.Weight, color: Color = Color.white) -> some View {
        modifier(TextCustomModifier(lineLimit: lineLimit, size: size, weight: weight, color: color))
    }
}
