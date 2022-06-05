//
//  ViewExtension.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/06.
//

import SwiftUI
extension View {
    func applyButtonCustomModifier(backgroundColor: Color = Color.blueMain, width: CGFloat = 125.0, height: CGFloat = 25.0, padding: CGFloat = 16, cornerRadius: CGFloat = 25.0, strokeLineWith: CGFloat = 1)-> some View {
        modifier(buttonCustomModifier(backgroundColor: backgroundColor, width: width, height: height, padding: padding, cornerRadius: cornerRadius, strokeLineWidth: strokeLineWith))
    }
}
