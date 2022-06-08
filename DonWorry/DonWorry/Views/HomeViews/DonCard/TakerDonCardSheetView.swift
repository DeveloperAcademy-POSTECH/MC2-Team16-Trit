//
//  TakerDonCardSheetView.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/09.
//

import SwiftUI

struct TakerDonCardSheetView: View {
    @Binding var showTakerSheet: Bool
    var currentUser: User
    var body: some View {
        // 현재사용자가 돈을 받아야할사람일때 어떤사람에게 돈을 받아야할지를 List로 반환해주는 함수(makegiverList)
        let givers: [User] = makeGiverList(users: users, contentUser: currentUser)
        ZStack {
            HStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("받을돈")
                                .font(.system(size: 20, weight: .bold))

                            HStack(alignment: .bottom) {
                                Text("18000원")
                                    .font(.system(size: 30, weight: .heavy))
                                    .offset(y: 3)
                                Text("/ \(currentUser.takeMoney!)원")
                                    .font(.system(size: 20, weight: .heavy))
                            }
                            Spacer().frame(height: 27)
                            Text("미정산 내역")
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
                            
                            HStack {
                                Text("루미네 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Spacer()
                                Text("\(givers[0].giveMoney!)원")
                                    .font(.system(size: 16, weight: .bold))
                            }
                        }
                        Spacer().frame(height: 27)
                        Text("정산 내역")
                            .font(.system(size: 15))
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
                            
                            HStack {
                                Text("루미네 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Spacer()
                                Text("\(givers[0].giveMoney!)원")
                                    .font(.system(size: 16, weight: .bold))
                        
                            }
                            .opacity(0.1)
                        }
                    }
                    .padding(.trailing, 25)
                    .padding(.leading, 10)
                }
                .padding(.trailing, 10)
                .offset(y: 50)
                Spacer()
            }
            LargeButton(text: "재촉하기", clicked: {
                showTakerSheet.toggle()
            })
            .offset(y: 200)
        }
        
    }
}

struct TakerDonCardSheetView_Previews: PreviewProvider {
    static var previews: some View {
        TakerDonCardSheetView(showTakerSheet: .constant(true), currentUser: user4)
    }
}
