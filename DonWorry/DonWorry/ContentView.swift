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
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {

        // no user logged in
        if authViewModel.userSession == nil {
            SignInView()
        } else {
        // have a logged in user
            HomeView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
