//
//  NewPayment_Title.swift
//  SpaceView
//
//  Created by 김승창 on 2022/06/01.
//

import SwiftUI

struct NewPaymentTitle: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var paymentTitle: String = ""
    
    let maxLength = 15
     
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            
            VStack(alignment: .leading, spacing: 10) {
                
                Group {
                    Text("정산 내역을")
                    Text("추가해볼까요?")
                }
                .font(.system(size: 30, weight: .bold))
                
            }
            
            VStack(spacing: 20) {
                
                UnderlineTextField(placeholder: "정산하고자 하는 항목을 입력하세요", charLimit: 20, text: $paymentTitle)
                
                Image("smartphone-with-bills")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding(.top, 30)
                                           
                Spacer()
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: NewPaymentIcon(paymentTitle: paymentTitle)) {
                        Text("다음")
                            .frame(width: 135, height: 50)
                            .foregroundColor(.white)
                            .background(paymentTitle.isEmpty ? .blue.opacity(0.3) : .blue)
                            .cornerRadius(29)
                    }
                    .padding(.bottom, 30)
                    .disabled(paymentTitle.isEmpty ? true : false)
                }
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .padding(.top, -20)
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
