//
//  SwiftUIView.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

import SwiftUI

// 사용예시
// Text("sssd")
//    .scaledFont(name: CustomFont.GmarketSansBold, size: 17)

struct CustomFont {
    static let GmarketSansBold = "GmarketSansTTFBold"
    static let GmarketSansLight = "GmarketSansTTFLight"
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}
