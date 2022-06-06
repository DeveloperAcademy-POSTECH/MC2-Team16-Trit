//
//  NewPaymentPrice.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

let rows = [
    ["1", "2", "3"],
    ["4", "5", "6"],
    ["7", "8", "9"],
    ["00", "0", "<"]
]

struct NewPaymentPrice: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var price = ""
    
    var numberPrice: Int {
        Int(price) ?? 0
    }
    
    let paymentTitle: String
    let paymentIcon: Image?
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 60) {
            HStack {
                paymentIcon?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 37, height: 37)
                    .background(Color.grayEE)
                    .cornerRadius(5)
                
                Text(paymentTitle)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            HStack(alignment: .bottom) {
                Text(price.isEmpty ? "0" : numberFormatter.string(for: numberPrice) ?? "")
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                
                Text("원")
                    .font(.system(size: 17))
            }
            
            HStack {
                Spacer()
                
                NavigationLink(destination: DecorateCardView(paymentIcon: paymentIcon)) {
                    Text("다음")
                        .frame(width: 135, height: 50)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(29)
                }
            }
            
            // 숫자 자판
            
            VStack {
                ForEach(rows, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { column in
                            Button {
                                pressNumber(price, column)
                            } label: {
                                Text(column)
                                    .font(.system(size: 20, weight: .bold))
                                    .frame(width: 125, height: 61)
                            }
                        }
                        .padding(.vertical, 17)
                    }
                }
            }
            .background(RoundedRectangle(cornerRadius: 38)
                .stroke(Color.gray97))
            
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 25)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
        }
    }
    
    func pressNumber(_ price: String, _ input: String) {
        
        // 0원인 상태에서 0 또는 00 버튼을 눌렀을 때 변하는게 없도록 합니다.
        if price.isEmpty && (input == "0" || input == "00") {
            return
        }
        
        // 금액이 1억원이 넘지 않도록 입력을 제한합니다.
        if price.count == 7 && input == "00" {
            return
        }
        
        // 금액이 1억원이 넘지 않도록 입력을 제한합니다.
        if price.count > 7 && input != "<" {
            return
        }
        
        // < 버튼을 눌렀다면 숫자를 하나 지우고, 다른 버튼을 눌렀다면 숫자를 추가합니다.
        if input == "<" {
            self.price.popLast()
        } else {
            self.price.append(contentsOf: input)
        }
    }
}

struct NewPaymentPrice_Previews: PreviewProvider {
    static var previews: some View {
        NewPaymentPrice(paymentTitle: "땡땡이네 스타벅스", paymentIcon: Image("chicken-leg"))
    }
}
