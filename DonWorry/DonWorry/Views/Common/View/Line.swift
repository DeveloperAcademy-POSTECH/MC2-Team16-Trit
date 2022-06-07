//
//  Line.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/06.
//

import SwiftUI

struct Line: View {
    var body : some View {
        Rectangle()
            .frame(height: 0.5, alignment: .bottom)
            .foregroundColor(.grayC5)
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line()
    }
}

