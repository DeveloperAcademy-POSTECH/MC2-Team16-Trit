//
//  TakerDonCard.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/03.
//

import SwiftUI

struct TakerDonCard: View {
    @State var takersheetStateModel = false
    
    var currentUser: User
    var body: some View {
        Button {
            takersheetStateModel.toggle()
        } label: {
            ZStack(alignment: .leading) {
                BasicRoundRec(color: .takerDonCardColor)
                TakerDonCardDetail(currentUser: currentUser)
                
            }
        }
        .sheet(isPresented: $takersheetStateModel) {
            TakerSheetView(currentUser: currentUser)
        }
    }
}

/*
struct TakerDonCard_Previews: PreviewProvider {
    static var previews: some View {
        TakerDonCard(takersheetStateModel: true, currentUser: users[0])
    }
}
 */

struct TakerSheetView: View {
    var currentUser: User
    @EnvironmentObject var viewModel: BaseViewModel
    var body: some View {
        // 현재사용자가 돈을 받아야할사람일때 어떤사람에게 돈을 받아야할지를 List로 반환해주는 함수(makegiverList)
        let givers = makeGiverList(trnasfers: transfers, currentUser: viewModel.authViewModel.currentUser)
        ZStack {
            HStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("받을돈")
                                .font(.system(size: 20, weight: .bold))

                            HStack(alignment: .bottom) {
                                Text("정산완료된 금액")
                                    .font(.system(size: 30, weight: .heavy))
                                    .offset(y: 3)
                                Text("총 받야아할 금액")
                                    .font(.system(size: 20, weight: .heavy))
                            }
                            Spacer().frame(height: 27)
                            Text("미정산 내역")
                                .font(.system(size: 15))
                        }
                        ForEach(0..<givers.count) {index in
                            HStack {
                                ZStack {
                                    ZStack(alignment: .center) {
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.grayBC)
                                        Image(systemName: "cart")
                                            .resizable()
                                            .foregroundColor(.black)
                                        .frame(width: 30, height: 30)
                                    }
                                }
                                HStack {
                                    Text(givers[index].giver.userName)
                                        .font(.system(size: 16, weight: .bold))
                                    
                                    Text("\(givers[index].amount)원")
                                }
                            }
                        }
                        Spacer().frame(height: 27)
                        Text("정산 내역")
                            .font(.system(size: 15))
                    }
                    .padding(.horizontal, 30)
                }
                .offset(y: 50)
                Spacer()
            }
            
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.9), Color.white.opacity(1)]), startPoint: .top, endPoint: .bottom))
                .frame(width: UIScreen.main.bounds.width, height: 150)
                .offset(y: 200)
                .blur(radius: 30)
            
            LargeButton(text: "재촉하기", clicked: {
                //
            })
                .offset(y: 200)
        }
        
    }
}

struct TakerDonCardDetail: View {
    var currentUser: User
    @EnvironmentObject var viewModel: BaseViewModel
    var body: some View {
        let givers = makeGiverList(trnasfers: transfers, currentUser: viewModel.authViewModel.currentUser)
        // 정산받아야할사람들(givers: [User])을 전부 보여주면 사람이 많아지면 카드 밖으로 이미지가 삐져나감
        // 그래서 최대 4명만 TakerDonCard에 보여주고 나머지 리스트는 옆의 점세개를 누르면 나오게끔
        let displayGivers = makeDisplayGiverList(makeGiverList: givers)
            VStack {
                Text("현재정산금액")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                    .offset(y: 20)
                
                HalfCircleProgressBar()
                    .offset(y: 40)
                HStack {
                    VStack {
                        Text("정산금액")
                            .font(.system(size: 8, weight: .medium))
                        Text("18000")
                            .font(.system(size: 10, weight: .bold))
                    }
                    .foregroundColor(.white)
                    Spacer().frame(width: 60)
                    VStack {
                        Text("미정산금액")
                            .font(.system(size: 8, weight: .medium))
                        Text("12000")
                            .font(.system(size: 10, weight: .bold))
                    }
                    .foregroundColor(.white)
                }
            }
            .offset(x: 0, y: -30)
            
            // 이미지를 누르면 프로필의 주인 이름이 출력됨
            HStack(spacing: -10) {
                ForEach(displayGivers, id: \.self) { giver in
                    Image(giver)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.white, lineWidth: 2))
                }
            }
            .offset(x: 15, y: 70)
            
            // 위에서 말했던 정산자가 4명을 넘어가면 이미지는 최대 4개를 보여주고 옆에 점버튼이 생김
            // 점버튼을 누르면 정산자의 전체 리스트가 출력됨
            if displayGivers.count > 3 {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.takerDonCardColor)
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                }
                .offset(x: 115, y: 70)
                .onTapGesture {
                    print("show all menbers")
                }
            }
        
    }
}
