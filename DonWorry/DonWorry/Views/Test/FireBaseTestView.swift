//
//  FireBaseTestView.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/09.
//

import SwiftUI

struct FireBaseTestView: View {
    
    var testUser = User(id: "dudwls0284", userName: "Charlie", profileImage: "user2", takeMoney: 33333, giveMoney: 12345, giveTo: "Avery", userAccount: "1234-5432-234", participant: "None")
    
    @ObservedObject var fireBaseModel = FireStoreViewModel()
    
    var body: some View {
        List(fireBaseModel.list) { item in
            HStack {
                Text(item.userName)
                
                Button {
                    fireBaseModel.updateUserName(userToUpdate: item, newName: "Asher")
                    fireBaseModel.getUserData()
                } label: {
                    Text("이름바꾸기")
                }.buttonStyle(BorderedButtonStyle())
                 
                Button {
                    fireBaseModel.deleteUserData(userToDelete: item)
                } label: {
                    Text("삭제")
                }.buttonStyle(BorderedButtonStyle())

            }
        }
        Spacer()
        Button {
            fireBaseModel.addUserData(user: testUser)
        } label: {
            Text("유저 추가하기")
        }

    }
    
    init() {
        print("hello")
        print(fireBaseModel.list)
        fireBaseModel.getUserData()
    }
    
}

struct FireBaseTestView_Previews: PreviewProvider {
    static var previews: some View {
        FireBaseTestView()
    }
}
