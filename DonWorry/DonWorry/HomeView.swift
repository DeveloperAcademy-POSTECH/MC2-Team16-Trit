//
//  HomeView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI

struct HomeView: View {
    @State var selection: String = "떱떱해"
    @State private var naviSelection: String? = nil
    //tag:  profile : 로 전환  / alert : 으로 전환
    
    var currentUser: User
    var body: some View {
        NavigationView {
            
           
            VStack {
                HStack {
                    HStack {
                        NavigationLink(destination: ProfileView(), tag: "profile", selection: $naviSelection) { EmptyView() }
                        
                        Button {
                            // TODO - 프로필뷰로 넘어갈 버튼
                            self.naviSelection = "profile"
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
                    NavigationLink(destination: AlertView(), tag: "alert", selection: $naviSelection) { EmptyView() }
                    
                    Button {
                        self.naviSelection = "alert"
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
            .navigationBarHidden(true)
        }

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(currentUser: user1)
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
