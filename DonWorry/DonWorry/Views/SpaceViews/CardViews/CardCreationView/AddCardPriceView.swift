//
//  AddCardPriceView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

let rows = [
    ["1", "2", "3"],
    ["4", "5", "6"],
    ["7", "8", "9"],
    ["00", "0", "delete.left"]
]

struct AddCardPriceView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var mainSelection: String? // SpaceMainView로 돌아가기 위한 변수입니다.
    @State private var price: String = ""
    @State private var naviSelection: String? = nil // 다음 페이지로 이동을 위한 일회성의 변수입니다.
    
    var numberPrice: Int {
        Int(price) ?? 0
    }
    
    var isDisable: Bool {
        price.isEmpty
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
        VStack {
            HStack {
                paymentIcon?
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .frame(width: 50, height: 50)
                    .background(Color.grayEE)
                    .cornerRadius(5)
                
                Text(paymentTitle)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            
            HStack(alignment: .bottom) {
                Text(price.isEmpty ? "0" : numberFormatter.string(for: numberPrice) ?? "")
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                
                Text("원")
                    .font(.system(size: 17))
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                NavigationLink(tag: "AddCardDecoView", selection: $naviSelection, destination: { AddCardDecoView(mainSelection: $mainSelection, paymentIcon: paymentIcon) }) { EmptyView() }
                    .isDetailLink(false)
                SmallButton(text: "다음", isDisable: isDisable) {
                    self.naviSelection = "AddCardDecoView"
                }
            }
            .disabled(isDisable ? true : false)
            .padding(.horizontal, 30)
            .padding(.bottom)
            
            // 숫자 자판
            VStack {
                ForEach(rows, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { column in
                            Button {
                                pressNumber(price, column)
                            } label: {
                                if column == "delete.left" {
                                    Image(systemName: "delete.left")
                                        .font(.system(size: 20, weight: .bold))
                                        .frame(width: 125, height: 50)
                                } else {
                                    Text(column)
                                        .font(.system(size: 20, weight: .bold))
                                        .frame(width: 125, height: 50)
                                }
                            }
                        }
                        .padding(.vertical, 17)
                    }
                }
            }
            .frame(height: 360, alignment: .top)
            .background(RoundedRectangle(cornerRadius: 38).stroke(Color.grayF5))
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(role: .cancel) {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .padding(.horizontal)
                }
                .buttonStyle(.plain)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
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
        if price.count > 7 && input != "delete.left" {
            return
        }
        
        // < 버튼을 눌렀다면 숫자를 하나 지우고, 다른 버튼을 눌렀다면 숫자를 추가합니다.
        if input == "delete.left" {
            self.price.popLast()
        } else {
            self.price += input
        }
    }
}

struct AddCardPriceView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardPriceView(mainSelection: .constant(""), paymentTitle: "땡땡이네 스타벅스", paymentIcon: Image("chicken-leg"))
    }
}
