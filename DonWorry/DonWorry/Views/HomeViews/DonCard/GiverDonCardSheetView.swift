//
//  GiverDonCardSheetView.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/09.
//

import SwiftUI

struct GiverDonCardSheetView: View {
    @Binding var showGiverSheet: Bool
    var currentUser: User
    var body: some View {
        let taker = findTaker(users: users, currentUser: currentUser)
        ZStack {
            HStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(taker.userName)
                                .font(.system(size: 20, weight: .bold))
                            Text("\(currentUser.giveMoney!)원")
                                .font(.system(size: 30, weight: .heavy))
                            Text(taker.userAccount!)
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.gray31)
                            Spacer().frame(height: 27)
                            Text("상세내역")
                                .font(.system(size: 15))
                        }

                        HStack {
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.grayBC)
                                Image(systemName: "cart")
                                    .resizable()
                                    .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                            }
                            VStack(alignment: .leading) {
                                Text("우디네 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Text("5/25")
                                    .font(.system(size: 16, weight: .bold))
                                    .opacity(0.4)
                            }
                        }

                        HStack {
                            Text("\(currentUser.giveMoney!)원")
                                .font(.system(size: 13))
                            Spacer().frame(width: 230)
                            Text("\(taker.takeMoney!)원")
                                .font(.system(size: 13))
                                .foregroundColor(.gray31)
                                .opacity(0.6)
                        }
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 325, height: 8)
                                .foregroundColor(.gray31)
                                .opacity(0.2)
                            HStack {
                                // 정산자(taker)가 받아야할 돈(taker.takemoney)과 contentUser가 보내야할돈(contentUser.giveMoney)의 비율을 계산해서 그래프로 표현
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: CGFloat((325*currentUser.giveMoney!)/taker.takeMoney!), height: 8)
                                .foregroundColor(.blueMain)
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.leading, 10)
                }
                .offset(y: 50)
                Spacer()
                
            }
            // 여기 버튼은 크기가 다른View들과는 달라서 이걸로 새로 만듦
            HStack {
                HalfSheetMediumButton(text: "계좌번호 복사하기", clicked: {
                    //
                })
                HalfSheetSmallButton(text: "보냈어요!", clicked: {
                    //
                })
            }
            .offset(y: 185)
        }
        
    }
}

struct GiverDonCardSheetView_Previews: PreviewProvider {
    static var previews: some View {
        GiverDonCardSheetView(showGiverSheet: .constant(true), currentUser: user4)
    }
}
