//
//  NewPaymentPrice.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI





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
                       .frame(width: 37, height: 37)
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
                     
                     NavigationLink(destination: NewPaymentDetail()) {
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
                                         .frame(width: 100, height: 50)
                                 }
                                 
                             }
                         }
                     }
                 }
                 
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
             if price.isEmpty && (input == "0" || input == "00") {
                 return
             }
             
             if price.count == 7 && input == "00" {
                 return
             }
             
             if price.count > 7 && input != "<" {
                 return
             }
             
             if input == "<" {
                 self.price.popLast()
             } else {
                 self.price.append(contentsOf: input)
             }
         }
     }

     struct NewPaymentPrice_Previews: PreviewProvider {
         static var previews: some View {
             NewPaymentPrice(paymentTitle: "땡떙이네 스타벅스", paymentIcon: Image("chicken-leg"))
         }
     }
