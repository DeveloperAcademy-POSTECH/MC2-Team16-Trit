//
//  SwiftUIView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI

struct SwiftUIView: View {
    @State var selection: String = "떱떱해"
    var contentUser: User
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Button {
                        //
                    } label: {
                        Image(contentUser.profileImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .background(.black)
                            .clipShape(Circle())
                    }
                    VStack(alignment: .leading) {
                        Text(contentUser.userName + "님")
                            .font(.system(size: 20, weight: .bold))
                        Text("안녕하세요")
                            .font(.system(size: 17))
                    }
                }
                Spacer()
                Button {
                    //
                } label: {
                    Image(systemName: "bell.circle.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 40))
                }
            }
            .padding(.bottom, 25)
            .padding(.horizontal, 20)
            RoomSwatchCellView(selection: $selection)
            Spacer().frame(height: 120)
            if contentUser.participate == selection {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ParticipateCard(isOnParticipate: false)
                        if contentUser.takeMoney != nil {
                            TakerCard(contentUser: contentUser)
                        }
                        if contentUser.giveMoney != nil {
                            GiverCard(contentUser: contentUser)
                        }
                    }
                }
            } else {
                ParticipateCard(isOnParticipate: true)
            }
            ButtonBottomCell()
            Spacer().frame(height: 120)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(contentUser: user4)
    }
}

struct ButtonBottomCell: View {
    var body: some View {
        HStack {            
            XSmallButton(icon: "magnifyingglass", clicked: {})
            MediumButton(text: "스페이스 만들기", clicked: {})
        }
        .offset(y: 160)
    }
}
