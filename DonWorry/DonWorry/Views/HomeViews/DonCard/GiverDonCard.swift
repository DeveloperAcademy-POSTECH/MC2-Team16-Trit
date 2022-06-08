//
//  TakerCard.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/03.

import SwiftUI

struct GiverDonCard: View {
    // 앱특성상 사용자에따라 같은 술자리라도 보이는 카드들과 View가 다르기때문에 사용자가 누군지를 알려주는 변수
    var currentUser: User
    var body: some View {
        ZStack {
            BasicRoundRec(color: .giverDonCardColor)
            GiverDonCardDetail(currentUser: currentUser)
        }
    }
}

struct GiverCard_Previews: PreviewProvider {
    static var previews: some View {
        GiverDonCard(currentUser: user1)
    }
}

struct GiverDonCardDetail: View {
    var currentUser: User
    var body: some View {
        VStack {
            // 현재사용유저(contentUser)가 누구에게 돈을 보내야하는지 찾는 함수 = findTaker
            // contentUser가 돈을 보내야하는 사람의 정보가 담긴 카드를 봐야함
            let taker = findTaker(users: users, currentUser: currentUser)
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
            Text("\(currentUser.giveMoney!)원")
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

func findTaker(users: [User], currentUser: User) -> User {
    var taker: User!
    users.forEach {
        if $0.userName == currentUser.giveTo {
            taker = $0
        }
    }
    return taker
}
