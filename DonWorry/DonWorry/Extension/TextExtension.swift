//
//  TextExtension.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/06.
//

import Foundation
import SwiftUI

extension Text {
    func applyTextWithLineLimitModifier(lineLimit: Int = 1, size: CGFloat, weight: Font.Weight, color: Color = Color.white) -> some View {
        modifier(textCustomModifier(lineLimit: lineLimit, size: size, weight: weight, color: color))
    }
}
