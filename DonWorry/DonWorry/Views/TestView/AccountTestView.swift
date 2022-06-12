//
//  AccountTestView.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/12.
//
import SwiftUI

struct AccountTestView: View {

    var testAccount = Account(accountHolder: "김승창", accountBank: "기업", accountNumber: "1234-456-3256")

    @ObservedObject var fireBaseModel = FireStoreViewModel()

    var body: some View {
        List(fireBaseModel.accountList) { item in
            HStack {
                VStack {
                    Text("예금주: \(item.accountHolder)")
                    Text("예금은행: \(item.accountBank)")
                    Text("계좌번호: \(item.accountNumber)")
                }

                Button {
                    fireBaseModel.updateAccount(AccountToUpdate: item, newBank: "농협")
                    fireBaseModel.getAccountDatas()
                } label: {
                    Text("은행바꾸기")
                }.buttonStyle(BorderedButtonStyle())

                Button {
                    fireBaseModel.deleteAccountData(accountToDelete: item)
                } label: {
                    Text("삭제")
                }.buttonStyle(BorderedButtonStyle())

            }
        }
        Spacer()
        Button {
            fireBaseModel.addAccountData(accountHolder: "정찬성", accountBank: "농협", accountNumber: "1234-4567-4234")
        } label: {
            Text("계좌 추가하기")
        }

    }

    init() {
        print("hello")
        print(fireBaseModel.accountList)
        fireBaseModel.getAccountDatas()
    }

}

struct AccountTestView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTestView()
    }
}
