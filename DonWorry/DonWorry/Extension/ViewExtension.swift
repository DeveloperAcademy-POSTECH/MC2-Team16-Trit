//
//  ViewExtension.swift
//  DonWorry
//
//

import SwiftUI

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    // 겉에 선이 있는 네모난 버튼을 만듦니다. 배경색, 버튼 크기를 정하고, padding으로 text와 겉의 선과 간격을 조정합니다. cornerRadius로 동그랗게 할 수있고, strokeLineWidth를 통해 겉에 선을 줄 수 있습니다.
    func applyButtonCustomModifier(backgroundColor: Color = Color.blueMain, width: CGFloat = 125.0, height: CGFloat = 25.0, padding: CGFloat = 16, cornerRadius: CGFloat = 25.0, strokeLineWith: CGFloat = 1)-> some View {
        modifier(ButtonCustomModifier(backgroundColor: backgroundColor, width: width, height: height, padding: padding, cornerRadius: cornerRadius, strokeLineWidth: strokeLineWith))
    }
}
