//
//  AdditionUserInfoTest.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/12.
//

import SwiftUI

struct AdditionUserInfoTest: View {

    @ObservedObject var fireBaseModel = FireStoreViewModel()
    var testSpaces: [Space] = []
    
    var body: some View {
        VStack {
            Spacer()
            Button {
//                fireBaseModel.fetchSpace(documentID: "LwwaYmBxs2X0wbSyX1eS")
//                fireBaseModel.loadSpace(userID: "kLObBC5frXFZuGpC9N31")
//                sleep(2)
//                print(fireBaseModel.resultSpaces)
                fireBaseModel.createSpace(spaceName: "안녕하세요", user: User.empty)
            } label: {
                Text("다음")
            }
        }
    }
}

struct AdditionUserInfoTest_Previews: PreviewProvider {
    static var previews: some View {
        AdditionUserInfoTest()
    }
}
