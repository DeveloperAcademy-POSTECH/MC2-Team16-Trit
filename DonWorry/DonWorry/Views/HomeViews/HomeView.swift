//
//  HomeView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI
import SlideOverCard

struct HomeView: View {
    @State var selection: String = "밤샘코딩"
    @State var isPresented: Bool = false
    @State private var showGiverSheet = false
    @State private var showTakerSheet = false
    @State var spaceID: String = ""
    
    var currentUser: User
    var body: some View {
        ZStack {
            MainProfileView(currentUser: currentUser)
                .padding(.bottom, 660)
            VStack {
                Spacer().frame(height: 50)
                SpaceChipsView(selection: $selection)
                Spacer().frame(height: 120)
                if currentUser.participant == selection {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ParticipateDonCard(isParticipateIn: false)
                            if currentUser.takeMoney != nil {
                                Button {
                                    showGiverSheet = true
                                } label: {
                                    GiverDonCard(currentUser: currentUser)
                                }
                                .sheet(isPresented: $showGiverSheet, content: {
                                    GiverDonCardSheet()
                                })
                            }
                            if currentUser.giveMoney != nil {
                                Button {
                                    showTakerSheet = true
                                } label: {
                                    TakerDonCard(currentUser: currentUser)
                                }
                                .sheet(isPresented: $showTakerSheet, content: {
                                    TakerDonCardSheet()
                                })
                            }
                        }
                    }
                } else {
                    ParticipateDonCard(isParticipateIn: true)
                }
                /* Bottom Buttons */
                Spacer().frame(height: 200)
            }
            HStack {
                XSmallButton(icon: "magnifyingglass") {
                    isPresented.toggle()
                }
                MediumButton(text: "스페이스 만들기") {
                    // Create Space
                }
            }
            .padding(.top, 700)
        }
        .slideOverCard(isPresented: $isPresented, onDismiss: {
            isPresented = false
        }) {
            VStack(alignment: .center, spacing: 25) {
                
                Image("cash-and-coins")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 50)
                
                VStack(spacing: 25) {
                    Text("스페이스ID로 정산에 참가하기").font(.system(size: 20, weight: .bold))
                    UnderlineTextField(placeholder: "스페이스 ID를 입력해주세요", charLimit: 20, text: $spaceID)
                }
                LargeButton(text: "스페이스 참가하기") {
                    isPresented = false
                    spaceID = ""
                }
            }
            .frame(width: 315, height: 350)
        }
        .ignoresSafeArea(.all)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(currentUser: user4)
    }
}

struct MainProfileView: View {
    var currentUser: User
    var body: some View {
        HStack {
            HStack {
                Button {
                    // TO DO - 프로필뷰로 넘어갈 버튼
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
                // TO DO - 알림창으로 넘어갈 버튼
            } label: {
                Image("alerticon")
                    .resizable()
                    .frame(width: 44, height: 44)
            }
        }
        .padding(.bottom, 25)
        .padding(.horizontal, 20)
    }
}
