//
//  ChooseBankSheet.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/05.
//

import Combine
import SwiftUI

let banks = ["국민은행", "기업은행", "농협은행", "신한은행", "우리은행", "하나은행", "부산은행", "새마을금고", "수협은행", "카카오뱅크", "케이뱅크", "토스뱅크"]

struct ChooseBankSheet: View {
    @Binding var showSheet: Bool
    @Binding var bank: String
    @State private var inputBank = ""
    let charLimit = 6
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
        //        GridItem(.fixed(0.1))
    ]
    
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    showSheet = false
                } label: {
                    Text("취소")
                }
                
                Spacer()
                Button {
                    showSheet = false
                    bank = inputBank
                } label: {
                    Text("확인")
                }
                .disabled(inputBank.isEmpty)
                
            }
            .foregroundColor(.black)
            .font(.system(size: 14))
            .padding()
            
            HStack {
                Text("은행선택")
                    .font(.system(size: 25, weight: .heavy))
                Spacer()
            }
            .padding()
            
            // Todo : 은행 직접 입력 추가
            ZStack(alignment: .leading) {
                TextField("직접입력", text: $inputBank)
                    .padding(.leading, 20)
                    .onReceive(Just(inputBank), perform: { _ in
                        if charLimit < inputBank.count {
                            inputBank = String(inputBank.prefix(charLimit))
                        }
                    })
                
                HStack {
                    Image(systemName: "pencil")
                    Spacer()
                    if !inputBank.isEmpty {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.medium)
                            .foregroundColor(Color(.systemGray3))
                            .padding(5)
                            .onTapGesture {
                                withAnimation {
                                    inputBank.removeAll()
                                }
                            }
                    }
                }
            }
            .padding()
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(banks, id: \.self) { bank in
                        
                        Button {
                            self.bank = bank
                            showSheet = false
                        } label: {
                            HStack {
                                Image(bank)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                                    .frame(width: 30, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.grayC5))
                                Text(bank)
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

struct ChooseBankSheet_Previews: PreviewProvider {
    static var previews: some View {
        ChooseBankSheet(showSheet: .constant(true), bank: .constant("카카오뱅크"))
    }
}
