//
//  HomeView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI

struct HomeView: View {
    @State var selection: String = "떱떱해"
    var currentUser: User
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Button {
                        // TODO - 프로필뷰로 넘어갈 버튼
                    } label: {
                        Image(currentUser.profileImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .background(.black)
                            .clipShape(Circle())
                    }
                    VStack(alignment: .leading) {
                        Text(currentUser.userName + "님")
                            .font(.system(size: 20, weight: .bold))
                        Text("안녕하세요")
                            .font(.system(size: 17))
                    }
                }
                Spacer()
                Button {
                    // TODO - 알림창으로 넘어갈 버튼
                } label: {
                    Image(systemName: "bell.circle.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 40))
                }
            }
            .padding(.bottom, 25)
            .padding(.horizontal, 20)
            RoomSwitchCellView(selection: $selection)
            Spacer().frame(height: 120)
            if currentUser.participant == selection {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ParticipateCard(isParticipateIn: false)
                        if currentUser.takeMoney != nil {
                            TakerCard(currentUser: currentUser)
                        }
                        if currentUser.giveMoney != nil {
                            GiverCard(currentUser: currentUser)
                        }
                    }
                }
            } else {
                ParticipateCard(isParticipateIn: true)
            }
            ButtonBottomCell()
            Spacer().frame(height: 120)
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        H(currentUser: user1)
//    }
//}

struct ButtonBottomCell: View {
    var body: some View {
        HStack {            
            XSmallButton(icon: "magnifyingglass", clicked: {})
            MediumButton(text: "스페이스 만들기", clicked: {})
        }
        .offset(y: 160)
    }
}
