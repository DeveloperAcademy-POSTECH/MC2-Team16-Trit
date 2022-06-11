//
//  UserViewStateModel.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/11.
//

import Foundation

@MainActor
class UserStateViewModel: ObservableObject {

    @Published var isLoggedIn = false
    
    func signIn() {
        isLoggedIn = true
    }

    func signOut() {
        isLoggedIn = false
    }
}
