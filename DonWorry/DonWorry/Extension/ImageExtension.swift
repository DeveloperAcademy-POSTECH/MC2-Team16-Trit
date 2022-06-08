//
//  ImageExtension.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/06.
//

import SwiftUI

extension Image {
    // 이미지를 네모칸에 넣어서 표현할 수 있습니다. 크기와 배경색, cornerRadius를 기입합니다. innerPadding을 기입하여 이미지와 네모 사이의 간격을 정합니다.
    func applyRectangleImageModifier(width: CGFloat, height: CGFloat, background: Color, innerPadding: CGFloat = 3, cornerRadius: CGFloat = 5.0) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
            .padding(innerPadding)
            .background(background)
            .cornerRadius(cornerRadius)
   }
    
    // 이미지를 동그랗게 자르고 주변을 background 색으로 칠합니다. innerPadding을 기입하여 이미지와 동그라미 사이의 간격을 정합니다.
    func applyClipCircleModifier(width: CGFloat, height: CGFloat, background: Color, innerPadding: CGFloat = 5 ) -> some View {
        self
            .applyRectangleImageModifier(width: width, height: height, background: background, innerPadding: innerPadding)
            .clipShape(Circle())
    }
        
}
