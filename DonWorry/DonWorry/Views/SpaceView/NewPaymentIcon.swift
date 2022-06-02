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
        VStack {
            
            
            VStack(spacing: 10) {
                HStack {
                    Text("정산내역 아이콘을")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                    
                    Spacer()
                }
                HStack {
                    Text("선택해주세요")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                    Spacer()
                }
            }
            
            Text("")
                .frame(height: 120)
            
            VStack {
                
                VStack {
                    
                    ScrollView {
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
                                            .frame(width: 50)
                                        
                                    }
                                }
                            }
                            
                        }
                    }
                    .frame(width: 340, height: 340)
                    
                    
                    
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: NewPaymentPrice(paymentTitle: paymentTitle, paymentIcon: paymentIcon)) {
                            Text("다음")
                                .frame(width: 135, height: 50)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(29)
                        }
                    }
                }
                
                
                
                Text("")
                    .frame(height: 160)
                
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

struct NewPaymentIcon1_Previews: PreviewProvider {
    static var previews: some View {
        NewPaymentIcon(paymentTitle: "땡땡이네 스타벅스")
    }
}
