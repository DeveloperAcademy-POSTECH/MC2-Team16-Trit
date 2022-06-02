//
//  NewPaymentIcon1.swift
//  SpaceView
//
//  Created by 김승창 on 2022/06/01.
//

import SwiftUI

struct NewPaymentIcon: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    let paymentTitle: String
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    @State private var paymentIcon: Image? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            
            VStack(alignment: .leading, spacing: 10) {
                
                Group {
                    Text("정산 내역을")
                    Text("추가해볼까요?")
                }
                .font(.system(size: 30, weight: .bold))
                
            }
            
            VStack {
                
                VStack {
                    
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns) {
                            ForEach(iconsArray, id: \.self) { iconName in
                                
                                Button {
                                    paymentIcon = Image(iconName)
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 14)
                                            .foregroundColor(Color(hex: "EEEEEE"))
                                            .frame(width: 102, height: 102)
                                        
                                        Image(iconName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: iconName == "chocolate-ice-cream" ? 30 : 50 ) // size
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                         
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: NewPaymentPrice(paymentTitle: paymentTitle, paymentIcon: paymentIcon)) {
                            Text("다음")
                                .frame(width: 135, height: 50)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(29)
                        }
                        .padding(.bottom, 30)
                    }
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

struct NewPaymentIcon1_Previews: PreviewProvider {
    static var previews: some View {
        NewPaymentIcon(paymentTitle: "땡땡이네 스타벅스")
    }
}
