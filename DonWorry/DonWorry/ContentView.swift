//
//  ContentView.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/05/29.
//

import SwiftUI

struct ContentView: View {
    @State var isClicked: Bool = false
    var body: some View {
        ChipButton(
            text: "chip",
            isClicked: $isClicked
        ) {
            print("ChipBtn Clicked!")
            isClicked.toggle()
        }
        // Sheet 사용 샘플 코드
//        SampleViewWithSheet()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
