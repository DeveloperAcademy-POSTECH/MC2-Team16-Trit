//
//  ChooseBankSheet.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/05.
//

import SwiftUI

let banks = ["국민은행", "기업은행", "농협은행", "신한은행", "우리은행", "하나은행", "부산은행", "새마을금고", "수협은행", "카카오뱅크", "케이뱅크", "토스뱅크"]

struct ChooseBankSheet: View {
    @State private var bank = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
        //        GridItem(.fixed(0.1))
    ]
    
    var body: some View {
        VStack {
            Text("은행선택")
            
            Image(systemName: "pencil.circle")
            TextField("\t\t직접 입력", text: $bank)
                .background(RoundedRectangle(cornerRadius: 14)
                    .foregroundColor(.grayE7)
                    .frame(height: 40))
                .padding()
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(banks, id: \.self) { bank in
                        HStack {
                            Image(systemName: "person")
                            Text(bank)
                            Spacer()
                        }
                        .padding()
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    // Todo : cancel button
                } label: {
                    Text("취소")
                        .foregroundColor(.black)
                }

            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    // Todo : confirm button
                } label: {
                    Text("완료")
                        .foregroundColor(.black)
                }

            }
        }
    }
}

struct ChooseBankSheet_Previews: PreviewProvider {
    static var previews: some View {
        ChooseBankSheet()
    }
}
