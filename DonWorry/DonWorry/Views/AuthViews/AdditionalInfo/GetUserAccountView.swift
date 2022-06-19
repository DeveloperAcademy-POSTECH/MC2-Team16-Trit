//
//  GetUserAccountView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/19.
//

import SwiftUI

struct GetUserAccountView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var accountBank = ""
    @State private var accountNumber = ""
    
    @State private var naviSelection: String? = nil
    
    var isDisable: Bool {
        accountBank.isEmpty || accountNumber.isEmpty
    }
    
    var body: some View {
        VStack {
            NewAccountTextField(accountBank: $accountBank, accountNumber: $accountNumber)
            
            Spacer()
            
            
            NavigationLink(tag: "TermView", selection: $naviSelection, destination: { TermView().environmentObject(authViewModel) }) { SmallButton(text: "다음", isDisable: isDisable) {
                naviSelection = "TermView"
            }}
            .disabled(isDisable ? true : false)
            .padding(.bottom)
        }
        .onAppear {
            UIApplication.shared.hideKeyboard()
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct GetUserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        GetUserAccountView()
    }
}
