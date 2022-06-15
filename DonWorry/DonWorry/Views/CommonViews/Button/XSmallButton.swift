//
//  XSmallButton.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/02.
//

import SwiftUI

struct XSmallButton: View {
    var icon: String
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) {
            Image(systemName: icon)
            .font(.system(size: 15, weight: .bold))
            .frame(width: 55, height: 20, alignment: .center)
            .foregroundColor(Color.white)
            .padding()
            .background(Color.grayBC)
            .cornerRadius(50)
        }
    }
}

/*
struct XSmallButton_Previews: PreviewProvider {
    static var previews: some View {
        XSmallButton(
            icon: "magnifyingglass"
        ) {
            print("Clicked!")
        }
    }
}
 */
