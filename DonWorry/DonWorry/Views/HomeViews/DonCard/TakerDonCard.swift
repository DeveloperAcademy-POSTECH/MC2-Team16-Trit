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
