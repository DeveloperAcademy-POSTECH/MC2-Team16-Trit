//
//  HalfSheetSmallButton.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/09.
//

import SwiftUI

struct HalfSheetSmallButton: View {
    var text: String
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) {
            HStack {
                Text(text)
            }
            .frame(width: 100, height: 20, alignment: .center)
            .foregroundColor(Color.white)
            .font(.system(size: 15, weight: .bold))
            .padding()
            .background(Color.blueMain)
            .cornerRadius(50)
        }
    }
}

/*
struct HalfSheetSmallButton_Previews: PreviewProvider {
    static var previews: some View {
        HalfSheetSmallButton()
    }
}
*/
