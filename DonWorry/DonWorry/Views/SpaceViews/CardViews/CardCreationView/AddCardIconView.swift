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
    
    @Binding var mainSelection: String? // SpaceMainView로 돌아가기 위한 변수입니다.
    @State private var paymentIcon : Image? = nil
    @State private var selectedItem: String = iconsArray.randomElement() ?? iconsArray[0]
    @State private var naviSelection : String? = nil // 다음 페이지로 이동을 위한 일회성의 변수입니다.
    private let iconColumns = [GridItem](repeating: GridItem(spacing: 10), count: 3)
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("아이콘을")
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
                        .padding(.bottom, 110)
                        .padding(.horizontal, 30)
                    }
                    
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    NavigationLink(tag: "AddCardPriceView", selection: $naviSelection, destination: { AddCardPriceView(mainSelection: $mainSelection, paymentTitle: paymentTitle, paymentIcon: paymentIcon) }) { EmptyView() }
                        .isDetailLink(false)
                    SmallButton(text: "다음", isDisable: false) {
                        self.naviSelection = "AddCardPriceView"
                        self.paymentIcon = Image(selectedItem)
                    }
                    .padding(.bottom)
                }
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
        AddCardIconView(paymentTitle: "땡땡이네 스타벅스", mainSelection: .constant(""))
    }
}
