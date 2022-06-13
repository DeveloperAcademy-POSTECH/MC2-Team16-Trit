//
//  FIreBaseTestView.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/11.
//

import SwiftUI

struct FireBaseTestView: View {

    var testUser = User(userName: "정찬희", nickName: "Lumi", account: "jlGwzhjurMFlAtvyJp0p", spaceList: [])

    @ObservedObject var fireBaseModel = FireStoreViewModel()

    var body: some View {
        List(fireBaseModel.userList) { item in
            HStack {
                Text(item.userName)

                Button {
//                    fireBaseModel.updateUserName(userToUpdate: item, newName: "김승창")
                    fireBaseModel.getUserData()
                } label: {
                    Text("이름바꾸기")
                }.buttonStyle(BorderedButtonStyle())

                Button {
//                    fireBaseModel.deleteUserData(userToDelete: item)
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
        print(fireBaseModel.userList)
        fireBaseModel.getUserData()
    }

}

struct FireBaseTestView_Previews: PreviewProvider {
    static var previews: some View {
        FireBaseTestView()
    }
}
