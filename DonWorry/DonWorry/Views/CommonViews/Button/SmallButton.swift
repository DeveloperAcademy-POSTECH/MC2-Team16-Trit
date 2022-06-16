//
//  SmallButton.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI

struct SmallButton: View {
    var text: String
    let isDisable: Bool
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) {
            HStack {
                Text(text)
            }
            .frame(width: 330, height: 20, alignment: .center)
            .foregroundColor(Color.white)
            .font(.system(size: 15, weight: .bold))
            .padding()
            .background(isDisable ? Color.disableBlue : Color.blueMain)
            .cornerRadius(50)
        }
    }
}

struct SmallButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallButton(text: "Small Button", isDisable: false) {
            print("Clicked!")
        }
        
//        SmallButton(
//            text: "Small Button"
//        ) {
//            print("Clicked!")
//        }
    }
}
