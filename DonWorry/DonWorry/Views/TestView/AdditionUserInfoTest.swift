//
//  AdditionUserInfoTest.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/12.
//

import SwiftUI

struct AdditionUserInfoTest: View {
    
    @State private var nickName: String
    @State private var AccountHolder: String
    @State private var AccountNumber: String
    @State private var Accountbank: String
    
    
    
    @ObservedObject var fireBaseModel = FireStoreViewModel()
    
    var body: some View {
        VStack {
            TextField("닉네임을 입력하세요", text: $nickName)
            TextField("예금주명을 입력하세요", text: $AccountHolder)
            TextField("계좌번호를 입력하세요", text: $AccountNumber)
            TextField("은행을 입력하세요", text: $Accountbank)
            Spacer()
            Button {
                fireBaseModel.addUserInfo(user: <#T##User#>, nickName: , accountHolder: AccountHolder, accountNumber: AccountNumber, accountName: Accountbank)
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
