//
//  ContentView.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/05/29.
//

import SwiftUI

struct ContentView: View {
    @State var isClicked: Bool = false
    
    @State var selectedTag: String?
    
    var body: some View {
        NavigationView {
                
            LargeButton(text: "Large Button") {
                self.selectedTag = "goProfileView"
            }
            .background(
                NavigationLink("", tag: "goProfileView", selection: $selectedTag, destination: {
                    ProfileView()
                })
                .onDisappear(perform: {
//                    print("onDisappear", selectedTag)
                })
                .onAppear(perform: {
                    selectedTag = ""
//                    print("onAppear", selectedTag)
                })
            )

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
