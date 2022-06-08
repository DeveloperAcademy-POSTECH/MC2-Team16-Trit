//
//  TakerDonCard.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/03.
//

import SwiftUI

struct TakerDonCard: View {
    var currentUser: User
    var body: some View {
        ZStack(alignment: .leading) {
            BasicRoundRec(color: .takerDonCardColor)
            TakerDonCardDetail(currentUser: currentUser)
        }
    }
}

struct TakerCard_Previews: PreviewProvider {
    static var previews: some View {
        TakerDonCard(currentUser: user4)
    }
}

struct TakerDonCardDetail: View {
    var currentUser: User
    var body: some View {
        // 정산받아야할사람들(givers: [User])을 전부 보여주면 사람이 많아지면 카드 밖으로 이미지가 삐져나감
        // 그래서 최대 4명만 TakerCard에 보여주고 나머지 리스트는 옆의 점세개를 누르면 나오게끔
        let displayGivers: [User] = makeDisplayGiverList(users: users, contentUser: currentUser)
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
                        Text("\(currentUser.takeMoney!)")
                            .font(.system(size: 10, weight: .bold))
                    }
                    .foregroundColor(.white)
                }
            }
            .offset(x: 0, y: -30)
            
            // 이미지를 누르면 프로필의 주인 이름이 출력됨
            HStack(spacing: -10) {
                ForEach(displayGivers) { giver in
                    Image(giver.profileImage)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.white, lineWidth: 2))
                        .onTapGesture {
                            print("clicked \(giver.userName) profile image")
                        }
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

func makeGiverList(users: [User], contentUser: User) -> [User] {
    var giverlist: [User] = []
    users.forEach {
        if $0.giveMoney != nil && $0.giveTo == contentUser.userName {
            giverlist.append($0)
        }
    }
    return giverlist
}

func makeDisplayGiverList(users: [User], contentUser: User) -> [User] {
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
