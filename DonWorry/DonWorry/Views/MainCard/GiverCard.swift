//
//  TakerCard.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/03.

import SwiftUI

struct GiverCard: View {
    // SheetView를 띄우기 위한 변수
    @State var giversheetState = false
    // 앱특성상 사용자에따라 같은 술자리라도 보이는 카드들과 View가 다르기때문에 사용자가 누군지를 알려주는 변수
    var currentUser: User
    var body: some View {
        Button {
            giversheetState.toggle()    
        } label: {
            ZStack {
                BasicRoundRec(color: .giverCardColor)
                GiverCardDetail(contentUser: currentUser)
            }
        }
        .sheet(isPresented: $giversheetState) {
            GiverSheetView(contentUser: currentUser)
        }
    }
}

struct GiverCard_Previews: PreviewProvider {
    static var previews: some View {
        GiverCard(currentUser: user1)
    }
}

struct GiverCardDetail: View {
    var contentUser: User
    var body: some View {
        VStack {
            // 현재사용유저(contentUser)가 누구에게 돈을 보내야하는지 찾는 함수 = findTaker
            // contentUser가 돈을 보내야하는 사람의 정보가 담긴 카드를 봐야함
            let taker = findTaker(users: users, contentUser: contentUser)
            Image(taker.profileImage)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 2))
            Text(taker.userName)
                .font(.system(size: 15, weight: .light))
                
            Spacer().frame(height: 20)
            Text("줄돈")
                .font(.system(size: 13, weight: .light))
            Text("\(contentUser.giveMoney!)원")
                .font(.system(size: 20, weight: .heavy))
            
            VStack {
                Image(systemName: "chevron.left.2")
                    .rotationEffect(.degrees(90))
                Spacer().frame(height: 5)
                // 우선 슬라이드해서 보내는 기능은 미구현, 우선 버튼으로
                Text("슬라이드해서 보내기")
                    .font(.system(size: 8, weight: .semibold))
            }
            .offset(y: 10)
            .opacity(0.35)
        }
        .foregroundColor(.white)
    }
}

struct GiverSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    var contentUser: User
    var body: some View {
        let taker = findTaker(users: users, contentUser: contentUser)
        ZStack {
            HStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(taker.userName)
                                .font(.system(size: 20, weight: .bold))
                            Text("\(contentUser.giveMoney!)원")
                                .font(.system(size: 30, weight: .heavy))
                            Text(taker.userAccount!)
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.gray31)
                            Spacer().frame(height: 27)
                            Text("상세내역")
                                .font(.system(size: 15))
                        }
                        .padding(.horizontal, 10)

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
                        .padding(.horizontal, 10)
                        HStack {
                            Text("\(contentUser.giveMoney!)원")
                                .font(.system(size: 13))
                            Spacer()
                            Text("\(taker.takeMoney!)원")
                                .font(.system(size: 13))
                                .foregroundColor(.gray31)
                                .opacity(0.6)
                        }
                        .padding(.horizontal, 10)
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 325, height: 8)
                                .foregroundColor(.gray31)
                                .opacity(0.2)
                                .padding(.horizontal, 10)
                            HStack {
                                Spacer().frame(width: 10)
                                // 정산자(taker)가 받아야할 돈(taker.takemoney)과 contentUser가 보내야할돈(contentUser.giveMoney)의 비율을 계산해서 그래프로 표현
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: CGFloat((325*contentUser.giveMoney!)/taker.takeMoney!), height: 8)
                                .foregroundColor(.blueMain)
                                Spacer()
                            }
                        }
                        Spacer().frame(height: 120)
                    }
                    .padding(.horizontal, 30)
                }
                .offset(y: 50)
                Spacer()
                
            }
            // 여기 버튼은 크기가 다른View들과는 달라서 이걸로 새로 만듦
            HStack {
                Button {
                    //
                } label: {
                    Text("계좌번호 복사하기")
                        .frame(width: 170, height: 26, alignment: .center)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .bold))
                        .padding()
                        .background(Color.grayBC)
                        .cornerRadius(50)
                }
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("보냈어요!")
                        .frame(width: 100, height: 26, alignment: .center)
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .bold))
                        .padding()
                        .background(Color.blueMain)
                        .cornerRadius(50)
                }
            }
            .offset(y: 200)
        }
        
    }
}

func findTaker(users: [User], contentUser: User) -> User {
    var taker: User!
    users.forEach {
        if $0.userName == contentUser.giveTo {
            taker = $0
        }
    }
    return taker
}
