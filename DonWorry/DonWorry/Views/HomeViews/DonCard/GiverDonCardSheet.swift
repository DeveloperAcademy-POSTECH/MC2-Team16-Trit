//
//  GiverDonCardSheet.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/11.
//

import SwiftUI

struct GiverDonCardSheet: View {
    let screenSize = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            VStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 40, height: 5)
                    .padding(.bottom, 30)
                    .padding(.horizontal)
                
                HStack {
                    Text("애셔에게 줄 돈")
                    Spacer()
                    Text("내가 내야할 돈")
                }
                .padding(.horizontal)
                .font(.system(size: 15, weight: .bold))
                HStack {
                    Text("98000원")
                    Spacer()
                    Text("120000원")
                }
                .padding(.horizontal)
                .font(.system(size: 20, weight: .heavy))
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: screenSize.width*0.92, height: 8)
                        .foregroundColor(.grayF6)
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: screenSize.width*0.92 * (98000/120000), height: 8)
                            .foregroundColor(.blueMain)
                        Spacer().frame(width: 64)
                    }
                }

                
                HStack {
                    Text("우리은행 11413-13414-13414134 (임영후)")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.gray75)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                GrayLine()
                    .padding(.bottom, 20)
                    .padding(.horizontal)
                
                HStack {
                    Text("상세내역")
                    Spacer()
                }
                .font(.system(size: 15, weight: .bold))
                .padding(0)
                .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    GiverDonCardSheetCell(place: "우디네 당구장", date: "5/25", number: 4, totalPayment: 184000, myPayment: 46000)
                    GiverDonCardSheetCell(place: "유쓰네 노래연습장", date: "5/25", number: 2, totalPayment: 152000, myPayment: 76000)
                }
                .padding(.horizontal)
                
                HStack {
                    HalfSheetMediumButton(text: "계좌번호 복사하기", clicked: {})
                    HalfSheetSmallButton(text: "보냈어요!", clicked: {})
                }
                
            }
            //VStack
        }
        //ZStack
    }
}

struct GiverDonCardSheet_Previews: PreviewProvider {
    static var previews: some View {
        GiverDonCardSheet()
    }
}

struct GiverDonCardSheetCell: View {
    var place: String
    var date: String
    var number: Int
    var totalPayment: Int
    var myPayment: Int
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
            VStack {
                HStack {
                    Text(place)
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    Text("\(totalPayment)원(\(number)명)")
                        .font(.system(size: 14, weight: .heavy))
                }
                HStack {
                    Text(date)
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundColor(.gray75)
                    Spacer()
                    Text("내가 내야할 돈 \(myPayment)원")
                        .font(.system(size: 16, weight: .heavy))
                }
            }
        }
        .padding(.bottom, 30)
    }
}
