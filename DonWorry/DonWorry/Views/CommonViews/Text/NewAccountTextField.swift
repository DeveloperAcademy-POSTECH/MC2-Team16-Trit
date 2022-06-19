//
//  NewAccountTextField.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/19.
//

import SwiftUI

struct NewAccountTextField: View {
    @State private var isBankSelect = true
    @Binding var accountBank: String
    
    @Binding var accountNumber: String
    
    private let bankColumns = [GridItem](repeating: GridItem(spacing: 10), count: 3)
    
    let banks = ["농협은행", "국민은행", "카카오뱅크", "새마을금고", "우리은행", "하나은행", "부산은행"]
    
    var body: some View {
        VStack {
            
            Text("계좌정보를 입력해주세요")
                .scaledFont(name: CustomFont.GmarketSansBold, size: 30)
            
            Spacer()
                .frame(height: 60)
            
            
            
            if isBankSelect {
                // MARK: - 은행 선택
                
                LazyVGrid(columns: bankColumns, spacing: 60) {
                    ForEach(banks, id: \.self) { bank in
                        
                        Button {
                            accountBank = bank
                            withAnimation {
                                isBankSelect = false
                            }
                            accountNumber = ""
                        } label: {
                            VStack {
                                Image(bank)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Text(bank)
                            }
                            .background(RoundedRectangle(cornerRadius: 15)
                                .frame(width: 110, height: 90)
                                .foregroundColor(.brown))
                        }
                    }
                }
                .padding(.horizontal)
                
            } else {
                // MARK: - 은행 선택 텍스트필드
                
                VStack(spacing: 60) {
                    VStack(alignment: .leading) {
                        Text("은행 선택")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                        VStack {
                            HStack {
                                Text(accountBank)
                                    .font(.body)
                                    .frame(height: 30)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .imageScale(.medium)
                                    .foregroundColor(Color(.systemGray3))
                                    .padding(5)
                                    .onTapGesture {
                                        withAnimation {
                                            isBankSelect = true
                                        }
                                    }
                            }
                            
                            Divider()
                                .frame(height: 1)
                                .padding(.horizontal, 40)
                                .background(.blue)
                        }
                        .frame(width: 335)
                    }
                    
                    // MARK: - 계좌번호 입력 텍스트필드
                    
                    VStack {
                        HStack {
                            TextField("계좌번호를 입력하세요", text: $accountNumber)
                                .font(.body)
                                .frame(height: 30)
                                .keyboardType(.decimalPad)

                            if !accountNumber.isEmpty {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.medium)
                                    .foregroundColor(Color(.systemGray3))
                                    .padding(5)
                                    .onTapGesture {
                                        withAnimation {
                                            accountNumber.removeAll()
                                        }
                                    }
                            }
                        }

                        Divider()
                            .frame(height: 1)
                            .padding(.horizontal, 40)
                            .background(.blue)
                    }
                    .frame(width: 335)
                    
                }
            }
        }
    }
}

struct NewAccountTextField_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountTextField(accountBank: .constant("카카오뱅크"), accountNumber: .constant("1023-312-4124534"))
    }
}
