//
//  SwiftUIView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI

struct SwiftUIView: View {
    var contentUser: User
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            ScrollView(.horizontal) {
                HStack {
                    ParticipateCard()
                    if contentUser.takeMoney != nil {
                        TakerCard(contentUser: contentUser)
                    }
                    
                    if contentUser.giveMoney != nil {
                        GiverCard(contentUser: contentUser)
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(contentUser: user4)
    }
}
