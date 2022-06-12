//
//  HomeView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI
import SlideOverCard

struct HomeView: View {
    
    @State var selection: String = "MC2 번개모임 엘리베이터 야야야1"
    @State var spaceID: String = ""
    @State var isPresented : Bool = false // Space 입장 ID 입력 Sheet
    @State var isSpaceView: Bool = false
    @State private var naviSelection: String? = nil // tag - profile: 로 전환, alert: 로 전환, create: 로 전환
    
    var currentUser: User
    var body: some View {
        
        if isSpaceView == true {
            
            SpaceMainView(spaceID: $spaceID)
            
        } else {
            
            NavigationView {
                ZStack {
                    VStack {
                        HStack {
                            HStack {

                                NavigationLink(destination: ProfileView(),
                                               tag: "profile",
                                               selection: $naviSelection){ EmptyView()}
                                Button {
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
                            
                            NavigationLink(destination: AlertView(),
                                           tag: "alert",
                                           selection: $naviSelection){ EmptyView()}
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
                        SpaceChipsView(selection: $selection)
                        Spacer().frame(height: 120)
                        if currentUser.participant == selection {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ParticipateDonCard(isParticipateIn: false, isSpaceView: $isSpaceView)
                                    
                                    if currentUser.takeMoney != nil {
                                        TakerDonCard(currentUser: currentUser)
                                    }
                                    if currentUser.giveMoney != nil {
                                        GiverDonCard(currentUser: currentUser)
                                    }
                                }
                            }
                        } else {
                            ParticipateDonCard(isParticipateIn: true, isSpaceView: $isSpaceView)
                        }
                        
                        /* Bottom Buttons */
                        HStack {
                            XSmallButton(icon: "magnifyingglass") {
                                isPresented.toggle()
                            }
                            NavigationLink(destination: AddSpaceView(),
                                           tag: "create",
                                           selection: $naviSelection){ EmptyView()}
                            MediumButton(text: "스페이스 만들기") {
                                self.naviSelection = "create"
                            }
                        }
                        .offset(y: 160)
                        
                        Spacer().frame(height: 120)
                    }
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
                        }
                        
                        LargeButton(text: "스페이스 참가하기") {
                            isPresented = false
                            isSpaceView.toggle()
                        }.padding(.bottom, 30)
                    }
                    .frame(width: 315, height: 350)
                }
            }
            
        }// else
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(currentUser: user4)
    }
}
