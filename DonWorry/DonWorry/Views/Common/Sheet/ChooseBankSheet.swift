//
//  ChooseBankSheet.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/05.
//

import SwiftUI

let banks = ["국민은행", "기업은행", "농협은행", "신한은행", "우리은행", "하나은행", "부산은행", "새마을금고", "수협은행", "카카오뱅크", "케이뱅크", "토스뱅크"]

struct ChooseBankSheet: View {
    @Binding var showSheet: Bool
    @Binding var bank: String
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
        //        GridItem(.fixed(0.1))
    ]
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button {
                    // Todo : 취소
                    showSheet = false
                } label: {
                    Text("취소")
                }
                
            }
            .foregroundColor(.black)
            .font(.system(size: 12))
            .padding()
            
            HStack {
                Text("은행선택")
                    .font(.system(size: 25, weight: .heavy))
                Spacer()
            }
            .padding()
            
            //            ZStack(alignment: .leading) {
            //
            //                TextField("\t 직접 입력", text: $bank)
            //                    .background(RoundedRectangle(cornerRadius: 14)
            //                        .foregroundColor(.grayE7)
            //                        .frame(height: 40))
            //                    .padding()
            //                Image(systemName: "pencil.circle")
            //                    .padding(.leading, 25)
            //            }
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(banks, id: \.self) { bank in
                        
                        Button {
                            // Todo : 은행 선택
                            self.bank = bank
                            showSheet = false
                        } label: {
                            HStack {
//                                Image(systemName: "person")
                                Image(bank)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(5)
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
