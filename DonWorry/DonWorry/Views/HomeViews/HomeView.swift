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
    @State var spaceID: String = ""
    @State var isPresented : Bool = false // Space 입장 ID 입력 Sheet
    
    @State private var naviSelection: String? = nil // SpaceMainView에서 HomeView로 한번에 dismiss시키기 위한 변수
    
    var currentUser: User
    
    var body: some View {
        ZStack {
            VStack {
                //profileView
                HStack {
                    HStack {
                        NavigationLink(destination: ProfileView(),
                                       tag: "ProfileView",
                                       selection: $naviSelection) { EmptyView() }
                            .isDetailLink(false)

                        Button {
                            self.naviSelection = "ProfileView"
                        } label: {
                            Image(currentUser.profileImage)
                                .resizable()
                                .scaledToFill()
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
                    
                    NavigationLink(destination: AlertView(),
                                   tag: "AlertView",
                                   selection: $naviSelection) { EmptyView() }
                        .isDetailLink(false)

                    Button {
                        self.naviSelection = "AlertView"
                    } label: {
                        Image("alerticon")
                            .resizable()
                            .frame(width: 42, height: 42)
                    }
                }
                .padding(.bottom, 25)
                .padding(.horizontal, 20)
                //profileView
                SpaceChipsView(selection: $selection)
                Spacer().frame(height: 120)
                if currentUser.participant == selection {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ParticipateDonCard(isParticipateIn: false, naviSelection: $naviSelection)
                            
                            if currentUser.takeMoney != nil {
                                TakerDonCard(currentUser: currentUser)
                            }
                            if currentUser.giveMoney != nil {
                                GiverDonCard(currentUser: currentUser)
                            }
                        }
                    }
                } else {
                    ParticipateDonCard(isParticipateIn: true, naviSelection: $naviSelection)
                }
                Spacer().frame(height: 220)
            }
            NavigationLink(tag: "SpaceMainView", selection: $naviSelection, destination: { SpaceMainView(naviSelection: $naviSelection, spaceID: .constant("Hardcoded ID")) }, label: { EmptyView() })
                .isDetailLink(false)
            
            HStack {
                XSmallButton(icon: "magnifyingglass", clicked: {})
                
                NavigationLink(destination: AddSpaceView(naviSelection: $naviSelection),
                               tag: "AddSpaceView",
                               selection: $naviSelection) { MediumButton(text: "스페이스 만들기", clicked: { self.naviSelection = "AddSpaceView" }) }
                    .isDetailLink(false)
            }
            .padding(.top, 700)
        }
        .navigationBarHidden(true)
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
                        .keyboardType(.asciiCapable)
                }
                
                LargeButton(text: "스페이스 참가하기") {
                    isPresented = false
                    naviSelection = "SpaceMainView"
                    
                }.padding(.bottom, 30)
            }
            .frame(width: 315, height: 350)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(currentUser: user2)
    }
}
