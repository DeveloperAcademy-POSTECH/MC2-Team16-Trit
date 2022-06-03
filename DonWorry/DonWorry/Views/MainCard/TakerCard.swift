//
//  TakerCard.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/03.
//

import SwiftUI

struct TakerCard: View {
    var contentUser: User
    var body: some View {
        let givers: [User] = makegiverList(users: users, contentUser: contentUser)
        ZStack {
            BasicRoundRec(color: .cardColor2)
            
            VStack {
                Text("현재정산금액")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                
                Rectangle()
                    .frame(width: 130, height: 80)
                HStack {
                    VStack {
                        Text("정산금액")
                            .font(.system(size: 8, weight: .medium))
                        Text("0")
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
                HStack(spacing: -10) {
                    ForEach(givers) {
                        Image($0.profileImage)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 2))
                    }
                    Spacer().frame(width: 60)
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.cardColor2)
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct TakerCard_Previews: PreviewProvider {
    static var previews: some View {
        TakerCard(contentUser: user2)
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
