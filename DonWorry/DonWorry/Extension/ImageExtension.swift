//
//  ImageExtension.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/06.
//

import SwiftUI

extension Image {
    func applyRectangleImageModifier(width: CGFloat, height: CGFloat, background: Color, innerPadding: CGFloat = 3, cornerRadius: CGFloat = 5.0) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
            .padding(innerPadding)
            .background(background)
            .cornerRadius(cornerRadius)
   }
    func applyClipCircleModifier(width: CGFloat, height: CGFloat, background: Color, innerPadding: CGFloat = 5 ) -> some View {
        self
            .applyRectangleImageModifier(width: width, height: height, background: background, innerPadding: innerPadding)
            .clipShape(Circle())
    }
        
}
