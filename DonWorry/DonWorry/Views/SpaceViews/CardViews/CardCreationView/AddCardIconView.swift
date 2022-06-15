//
//  AddCardIconView1.swift
//  SpaceView
//
//  Created by 김승창 on 2022/06/01.
//

import SwiftUI

let iconsArray = ["apple-1", "birthday-cake", "blue-car", "camera-icon", "chicken-leg", "chocolate-ice-cream", "coffee-cup", "gas-station", "gift-box", "movie-camera", "shopping-cart", "soccer-ball", "spoon-and-knife", "wine-glass"]

struct AddCardIconView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = false
    
    let paymentTitle: String
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    @State private var paymentIcon: Image? = nil
    @State private var selectedItem: String = ""
    
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
                                    selectedItem = iconName
                                    
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 14)
                                            .foregroundColor(iconName == selectedItem ? Color.grayD0 : Color.grayEE)
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
                        
                        NavigationLink(destination: AddCardPriceView(paymentTitle: paymentTitle, paymentIcon: paymentIcon)) {
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
        .navigationBarTitleDisplayMode(.inline)
        .gesture(DragGesture().updating($dragOffset) { (value, state, transaction) in
            if (value.startLocation.x < 30 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }
        })
    }
}

struct AddCardIconView1_Previews: PreviewProvider {
    static var previews: some View {
        AddCardIconView(paymentTitle: "땡땡이네 스타벅스")
    }
}
