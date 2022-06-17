//
//  TakerCard.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/03.

import SwiftUI

struct GiverDonCard: View {
    // 앱특성상 사용자에따라 같은 술자리라도 보이는 카드들과 View가 다르기때문에 사용자가 누군지를 알려주는 변수
    var currentUser: OldUser
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

func findTaker(users: [OldUser], currentUser: OldUser) -> OldUser {
    var taker: OldUser!
    users.forEach {
        if $0.userName == currentUser.giveTo {
            taker = $0
        }
    }
    return taker
}
