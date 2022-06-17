//
//  TakerDonCardSheet.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/11.
//

import SwiftUI

struct TakerDonCardSheet: View {
    @Environment(\.presentationMode) var presentationmode
    let screenSize = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            VStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 40, height: 5)
                    .padding(.vertical, 30)
                    .padding(.horizontal)
                
                HStack {
                    Text("받을 돈")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                }
                .padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                
                HStack(alignment: .bottom) {
                    Text("12000원")
                        .font(.system(size: 30, weight: .heavy))
                    Text("/ 240000원")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 2)
                    Spacer()
                }
                .padding(.horizontal)
                .font(.system(size: 20, weight: .heavy))
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: screenSize.width*0.92, height: 8)
                        .foregroundColor(.grayF6)
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: screenSize.width*0.92 * (12000/24000), height: 8)
                            .foregroundColor(.blueMain)
                        Spacer().frame(width: 64)
                    }
                }
                
                GrayLine()
                    .padding(.vertical, 20)
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    HStack {
                        Text("미정산 내역")
                        Spacer()
                    }
                    .font(.system(size: 15, weight: .bold))
                    TakerDonCardSheetCell(userName: "유스햄", payment: 6000)
                    TakerDonCardSheetCell(userName: "임애셔", payment: 6000)
                    
                    HStack {
                        Text("정산 영역")
                        Spacer()
                    }
                    .font(.system(size: 15, weight: .bold))
                    TakerDonCardSheetCell(userName: "김찰리", payment: 6000)
                        .opacity(0.3)
                    TakerDonCardSheetCell(userName: "뀨햄", payment: 6000)
                        .opacity(0.3)
                    
                }
                .padding(.horizontal)
                
                HStack {
                    LargeButton(text: "재촉하기", isDisable: false){
                        self.presentationmode.wrappedValue.dismiss()
                    }
                    
                }
            }
        }
    }
}

struct TakerDonCardSheet_Previews: PreviewProvider {
    static var previews: some View {
        TakerDonCardSheet()
    }
}

struct TakerDonCardSheetCell: View {
    var userName: String
    var payment: Int
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray31)
                Image(systemName: "flame")
                    .foregroundColor(.blue)
                    .frame(width: 40, height: 40)
            }
            HStack {
                Text(userName)
                Spacer()
                Text("\(payment)원")
            }
        }
        .padding(.bottom, 10)
    }
}
