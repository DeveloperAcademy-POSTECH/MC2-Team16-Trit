//
//  ContentView.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/05/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        NoticeMsg(
            text: "스페이스를 만들거나, 검색하여 정산을 시작하세요!"
        )
        
        UnderlineTextField()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
