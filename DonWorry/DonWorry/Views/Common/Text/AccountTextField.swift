//
//  AccountTextField.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/03.
//

import Combine
import SwiftUI

struct AccountTextField: View {
    @State private var account = ""
    
    let charLimit = 14
    
    var body: some View {
        ZStack(alignment: .leading ) {
            
            HStack {
                TextField("계좌번호를 입력해주세요.", text: $account)
                    .padding(.leading, 110)
                    .keyboardType(.numberPad)
                    .onReceive(Just(account), perform: { _ in
                        if charLimit < account.count {
                            account = String(account.prefix(charLimit))
                        }
                    })
                
                if !account.isEmpty {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.medium)
                        .foregroundColor(Color(.systemGray3))
                        .padding(5)
                        .onTapGesture {
                            withAnimation {
                                account.removeAll()
                            }
                        }
                }
            }
            .font(.system(size: 13))
            .frame(width: 350, height: 50)
            .background(Color.grayF6)
            .cornerRadius(29)
            
            HStack {
                Text("은행 선택")
                Image(systemName: "chevron.down")
            }
            .font(.system(size: 13))
            .foregroundColor(.white)
            .frame(width: 101, height: 50)
            .background(Color.grayBD)
            .cornerRadius(29)
        }
    }
}

struct AccountTextField_Previews: PreviewProvider {
    static var previews: some View {
        AccountTextField()
    }
}
