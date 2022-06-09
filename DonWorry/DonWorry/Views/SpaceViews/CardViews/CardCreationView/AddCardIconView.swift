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
    
    let paymentTitle: String
    
    @State private var paymentIcon : Image? = nil
    @State private var selectedItem: String = ""
    @State private var naviSelection : String? = nil
    private let iconColumns = [GridItem](repeating: GridItem(spacing: 10), count: 3)
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                        Text("정산 내역을")
                        Text("추가해볼까요?")
                }
                .font(.system(size: 25, weight: .bold))
                .padding(.horizontal, 30)
                .padding(.vertical)
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        
                        LazyVGrid(columns: iconColumns, spacing: 10) {
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
                        .padding(.horizontal, 30)
                    }
                }
            }
            
                        VStack {
                            Spacer()
                            NavigationLink(destination: AddCardPriceView(paymentTitle: paymentTitle, paymentIcon: paymentIcon),
                                           tag: "price",
                                           selection: $naviSelection) {EmptyView()}
                            HStack {
                                Spacer()
                                SmallButton(text: "다음") {
                                    self.naviSelection = "price"
                                }
                            }
                            .padding(.horizontal, 30)
                        }
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
}

struct AddCardIconView1_Previews: PreviewProvider {
    static var previews: some View {
        AddCardIconView(paymentTitle: "땡땡이네 스타벅스")
    }
}
