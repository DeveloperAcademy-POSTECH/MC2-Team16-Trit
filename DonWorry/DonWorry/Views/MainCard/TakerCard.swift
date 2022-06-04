//
//  TakerCard.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/03.
//

import SwiftUI

struct TakerCard: View {
    @StateObject var sheetStateModel = SheetStateModel()
    var contentUser: User
    var body: some View {
        let givers: [User] = makegiverList(users: users, contentUser: contentUser)
        let displayGivers: [User] = makeDisplaygiverList(users: users, contentUser: contentUser)
        Button {
            sheetStateModel.showSheet.toggle()
        } label: {
            ZStack(alignment: .leading) {
                BasicRoundRec(color: Color(hex: "60B35B"))
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
                            Text("\(contentUser.takeMoney!)")
                                .font(.system(size: 10, weight: .bold))
                        }
                        .foregroundColor(.white)
                    }
                }
                .offset(x: 0, y: -30)
                
                HStack(spacing: -10) {
                    ForEach(displayGivers) { giver in
                        Button {
                            print("button clicked")
                        } label: {
                            Image(giver.profileImage)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(.white, lineWidth: 2))
                        }
                    }
                }
                .offset(x: 15, y: 70)
                
                Button {
                    print(givers)
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.cardColor2)
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                    }
                }
                .offset(x: 115, y: 70)
            }
        }
        .halfSheet(showSheet: $sheetStateModel.showSheet) {
            TakerSheetView(contentUser: contentUser)
                .environmentObject(sheetStateModel)
        } onEnd: {
            print("Sheet Dismissed")
        }
    }
}

struct TakerCard_Previews: PreviewProvider {
    static var previews: some View {
        TakerCard(contentUser: user4)
    }
}

struct TakerSheetView: View {
    @EnvironmentObject var sheetStateModel: SheetStateModel
    var contentUser: User
    var body: some View {
        let taker = findTaker(users: users, contentUser: contentUser)
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
                                Text("/ \(contentUser.takeMoney!)원")
                                    .font(.system(size: 20, weight: .heavy))
                            }
                            Spacer().frame(height: 27)
                            Text("미정산 내역")
                                .font(.system(size: 15))
                        }

                        HStack {
                            Image("storeicon")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text("aaaaaa 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Text("5/aaaaaaaaaa")
                                    .font(.system(size: 16, weight: .bold))
                                    .opacity(0.4)
                            }
                        }
                        HStack {
                            Image("storeicon")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text("aaaaaa 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Text("5/aaaaaaaaaa")
                                    .font(.system(size: 16, weight: .bold))
                                    .opacity(0.4)
                            }
                        }
                        HStack {
                            Image("storeicon")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text("aaaaaa 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Text("5/aaaaaaaaaa")
                                    .font(.system(size: 16, weight: .bold))
                                    .opacity(0.4)
                            }
                        }
                        HStack {
                            Image("storeicon")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text("aaaaaa 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Text("5/aaaaaaaaaa")
                                    .font(.system(size: 16, weight: .bold))
                                    .opacity(0.4)
                            }
                        }
                        HStack {
                            Image("storeicon")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text("aaaaaa 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Text("5/aaaaaaaaaa")
                                    .font(.system(size: 16, weight: .bold))
                                    .opacity(0.4)
                            }
                        }
                        HStack {
                            Image("storeicon")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text("aaaaaa 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Text("5/aaaaaaaaaa")
                                    .font(.system(size: 16, weight: .bold))
                                    .opacity(0.4)
                            }
                        }
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
            
            LargeButton(text: "재촉하기", clicked: {})
                .offset(y: 200)
        }
        
    }
}

func makegiverList(users: [User], contentUser: User) -> [User] {
    var giverlist: [User] = []
    users.forEach {
        if $0.giveMoney != nil && $0.giveTo == contentUser.userName { 
            giverlist.append($0)
        }
    }
    return giverlist
}

func makeDisplaygiverList(users: [User], contentUser: User) -> [User] {
    var giverlist: [User] = []
    
    if users.count > 3 {
        users[0..<4].forEach {
            if $0.giveMoney != nil && $0.giveTo == contentUser.userName {
                giverlist.append($0)
            }
        }
    } else {
        users.forEach {
            if $0.giveMoney != nil && $0.giveTo == contentUser.userName {
                giverlist.append($0)
            }
        }
    }
    return giverlist
}
