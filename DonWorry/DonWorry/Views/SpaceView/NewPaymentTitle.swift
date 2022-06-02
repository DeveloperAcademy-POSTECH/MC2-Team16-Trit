//
//  NewPayment_Title.swift
//  SpaceView
//
//  Created by 김승창 on 2022/06/01.
//


import Combine
import SwiftUI

struct NewPaymentTitle: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var paymentTitle: String = ""
    
    let maxLength = 15
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            //            Text("정산 내역을\n추가해볼까요?")
            //                .fontWeight(.bold)
            //                .font(.system(size: 30))
            //                .frame(width: 300, height: 500)
            //                .multilineTextAlignment(.leading)
            //                .allowsTightening(true)
            
            
            VStack(spacing: 10) {
                HStack {
                    Text("정산 내역을")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                    
                    Spacer()
                }
                HStack {
                    Text("추가해볼까요?")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                    Spacer()
                }
            }
            
            
            
            VStack(spacing: 14) {
                HStack {
                    TextField("정산하고자 하는 항목을 입력하세요", text: $paymentTitle)
                        .textInputAutocapitalization(.never)
                        .onReceive(Just(paymentTitle), perform: { _ in
                            if maxLength < paymentTitle.count {
                                paymentTitle = String(paymentTitle.prefix(maxLength))
                            }
                        })
                    
                    Button {
                        paymentTitle = ""
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.gray)
                    }
                    
                    
                }
                
                
                // Textfield 밑줄
                Rectangle()
                    .frame(height: 1.0, alignment: .bottom)
                    .foregroundColor(.blue)
                
                
                Text("")
                    .frame(height: 60)
                
                
                Image("smartphone-with-bills")
//                    .resizable()
//                    .scaledToFill()
                    
                //                    .resizable()
                                    
                
                
                
                Text("")
                    .frame(height: 80)
                
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: NewPaymentIcon(paymentTitle: paymentTitle)) {
                        Text("다음")
                            .frame(width: 135, height: 50)
                            .foregroundColor(.white)
                            .background(paymentTitle.isEmpty ? .blue.opacity(0.3) : .blue)
                            .cornerRadius(29)
                    }
                    .disabled(paymentTitle.isEmpty ? true : false)
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
}

struct NewPayment_Title_Previews: PreviewProvider {
    static var previews: some View {
        NewPaymentTitle()
    }
}
