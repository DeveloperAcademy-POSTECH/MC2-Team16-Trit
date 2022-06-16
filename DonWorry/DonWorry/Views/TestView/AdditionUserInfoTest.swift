////
////  AdditionUserInfoTest.swift
////  DonWorry
////
////  Created by YeongJin Jeong on 2022/06/12.
////
//
import SwiftUI

struct AdditionUserInfoTest: View {

//    @ObservedObject var fireBaseModel = FireStoreViewModel()
    @ObservedObject var spaceViewModel = SpaceViewModel()
    
    
    var body: some View {
        VStack {
            List(spaceViewModel.spaceList) { item in
                VStack {
                    Text(item.spaceName)
                    Text(item.id ?? "")
                    Text(item.spaceID)
                }
            }
//            Button {
//                spaceViewModel.deleteSpace(spaceID: "I4taNoSnRFfmoVDOg1Rf", user: <#T##User#>)
//            } label: {
//                Text("payment 추가")
//            }

            Button {
//                transferViewModel.createTransfer(user: User.empty)
//                transferViewModel.fetchTransferList(from: "LwwaYmBxs2X0wbSyX1eS")
//                transferViewModel.fetchTakingList(from: "LwwaYmBxs2X0wbSyX1eS", userID: "wNDy13aWfsYOcNSEQbNp")
//                transferViewModel.fetchTakingList(userID: "EqPSsdqxwo8C0AKBFGda")
//                paymentViewModel.addPayment(spaceID: "oTDwECdVsg0Nvfveyxrg", data: testpayment, user: User.empty)
                
//                paymentViewModel.updatePaymentTitle(with: "루미에게 50000원", paymentID: "4CHfxImRfBjAG1LzE3Uu")
//                paymentViewModel.updatePaymentAmount(with: 1333, paymentID: "4CHfxImRfBjAG1LzE3Uu")
//                paymentViewModel.updatePaymentAttached(with: ["2344","32eds","123ewe"], paymentID: "4CHfxImRfBjAG1LzE3Uu")
//                paymentViewModel.deletePayment(paymentID: "9c2GTSCq5PBNQMKkYK3W")
//                paymentViewModel.fetchPayments(of: "oTDwECdVsg0Nvfveyxrg")
                spaceViewModel.deleteSpace(spaceID: "2FFHu0lxby1ZQCkAObDU")
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
