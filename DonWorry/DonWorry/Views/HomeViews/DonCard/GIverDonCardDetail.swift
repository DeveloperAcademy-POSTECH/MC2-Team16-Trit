//
//  GIverDonCardDetail.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/10.
//

import SwiftUI

struct GiverDonCardDetail: View {
    var currentUser: OldUser
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
        }
        .foregroundColor(.white)
    }
}
