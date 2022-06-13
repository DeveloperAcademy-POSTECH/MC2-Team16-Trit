//
//  LargeButton.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI

struct LargeButton: View {
    var text: String
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) {
            HStack {
                Text(text)
            }
            .frame(width: 328, height: 20, alignment: .center)
            .foregroundColor(Color.white)
            .font(.system(size: 15, weight: .bold))
            .padding()
            .background(Color.blueMain)
            .cornerRadius(50)
        }
    }
}

/*
struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton(
            text: "Large Button"
        ) {
            print("Clicked!")
        }
    }
}
 */
