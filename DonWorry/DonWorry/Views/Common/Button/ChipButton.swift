//
//  ChipButton.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/02.
//

import SwiftUI

struct ChipButton: View {
    var text: String
    @Binding var isClicked: Bool
    
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) {
            HStack {
                Text(text)
            }
            .frame(width: 80, height: 12, alignment: .center)
            .foregroundColor(isClicked ? Color.white : Color.gray31)
            .font(.system(size: 13, weight: .bold))
            .padding()
            .background(isClicked ? Color.blueMain : Color.grayEF)
            .cornerRadius(50)
        }
    }
}

/*
 
struct ChipButton_Previews: PreviewProvider {
    static var previews: some View {
        ChipButton(
            text: "chip",
            isClicked: $isClicked
        ) {
            print("ChipBtn Clicked!")
        }
    }
}
 
*/
