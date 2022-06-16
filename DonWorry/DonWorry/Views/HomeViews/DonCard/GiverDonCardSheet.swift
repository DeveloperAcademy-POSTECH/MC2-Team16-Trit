//
//  GiverDonCardSheet.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/11.
//

import SwiftUI

struct GiverDonCardSheet: View {
//    var percentage: Double = 81.5
    
    // FIXME: 하드코딩 해놓은 계좌정보입니다. 데이터를 받아올 때 수정해야합니다.
    let hardcodedAccount = "1002 - 045 -401235"
    
    @State var isAccountPopupPresented = false
    
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
                
                HStack(alignment: .bottom, spacing: 3) {
                    Text("임영후")
                        .font(.system(size: 22, weight: .heavy))
                    Text("님께")
                        .font(.system(size: 15, weight: .medium))
                        .padding(.bottom, 2)
                    Spacer()
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 15)
                
                HStack {
                    Text("송금할 금액")
                    Spacer()
                    Text("나의 정산 총액")
                        .opacity(0.3)
                }
                .padding(.horizontal)
                .font(.system(size: 13, weight: .medium))
                HStack {
                    HStack(alignment: .bottom, spacing: 2) {
                        Text("100000")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.blueMain)
                        Text("원")
                            .font(.system(size: 15, weight: .heavy))
                            .padding(.bottom, 3)
                    }
                    Spacer()
                    HStack(alignment: .bottom, spacing: 2) {
                        Text("120000")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.blueMain)
                        Text("원")
                            .font(.system(size: 15, weight: .heavy))
                            .padding(.bottom, 3)
                    }
                    .opacity(0.3)
                }
                .padding(.horizontal)
                .font(.system(size: 20, weight: .heavy))
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: screenSize.width*0.92, height: 8)
                        .foregroundColor(.grayF6)
                    HStack {
//                        ProgressView(value: percentage, total: 100)
//                            .progressViewStyle(LinearProgressViewStyle(tint: .blueMain))
//                            .padding(.horizontal, 15)
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: screenSize.width*0.92 * (100000/120000), height: 8)
                            .foregroundColor(.blueMain)
                    }
                }
                         
                Button {
                    
                    // FIXME: 하드코딩한 계좌번호를 복사합니다. 데이터를 받을 때 수정해야합니다.
                    pasteboard.string = hardcodedAccount
                    isAccountPopupPresented = true
                    
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("우리은행")
                                .padding(.bottom, 5)
                            
                            HStack {
                                Text("1002 - 045 -401235")
                                Text("(임영후)")
                            }
                        }
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Color.grayAccount)
                        
                        Spacer()
                        Image(systemName: "doc.on.doc")
                            .foregroundColor(.grayWithBlue)
                    }
                    .padding(20)
                    .frame(width: 360, height: 90, alignment: .leading)
                    .background(Color.grayF0)
                    .cornerRadius(8)
                }
            
                .padding(.vertical, 15)
                     
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
                
//                HStack {
//                    HalfSheetMediumButton(text: "계좌번호 복사하기", clicked: {
//                        isAccountPopupPresented.toggle()
//                    })
//                    HalfSheetSmallButton(text: "보냈어요!", clicked: {
//                        self.presentationmode.wrappedValue.dismiss()
//                    })
//                }
                SmallButton(text: "임영후님께 돈을 보냈습니다", isDisable: false, clicked: {})
                
            }
        }
        //
        .popup(isPresented: $isAccountPopupPresented, type: .floater(verticalPadding: 20), position: .top, animation: .spring(), autohideIn: 1, closeOnTap: true, closeOnTapOutside: true, view: {
            copyTopToastMessage()
        })
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
            VStack(spacing: 3) {
                HStack {
                    Text(place)
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    HStack(spacing: 2) {
                        Text("\(totalPayment)원")
                            .foregroundColor(Color(hex: "585656"))
                        Text("/\(number)명")
                            .foregroundColor(Color(hex: "0A84FF"))
                    }
                    .font(.system(size: 13, weight: .medium))
                }
                HStack {
                    Text(date)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(.grayBC)
                    Spacer()
                    Text("\(myPayment)원")
                        .font(.system(size: 16, weight: .heavy))
                }
            }
        }
        .padding(.bottom, 15)
    }
}
