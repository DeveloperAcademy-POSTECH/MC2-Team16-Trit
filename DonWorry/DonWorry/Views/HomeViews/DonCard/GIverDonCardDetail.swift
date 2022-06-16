//
//  GIverDonCardDetail.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/10.
//

import SwiftUI

// TODO: 파일명 수정해주세요!!
struct GiverDonCardDetail: View {
    var currentUser: OldUser
    var body: some View {
        VStack {
            // 현재사용유저(contentUser)가 누구에게 돈을 보내야하는지 찾는 함수 = findTaker
            // contentUser가 돈을 보내야하는 사람의 정보가 담긴 카드를 봐야함
//            let taker = findTaker(users: users, currentUser: currentUser)
            // TODO: 임시로 taker 넣어둠! -> transfer vm 으로 바꿔야할듯
            let taker: User = .empty
            Image(taker.image)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 2))
            Text(taker.userName)
                .font(.system(size: 15, weight: .light))
                
            Spacer().frame(height: 20)
            Text("줄돈")
                .font(.system(size: 13, weight: .light))
            Text("\(100+2200)원") // 줘야할돈
                .font(.system(size: 20, weight: .heavy))
        }
        .foregroundColor(.white)
    }
}
