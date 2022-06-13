//
//  HomeView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//

import SwiftUI
import SlideOverCard

struct HomeView: View {
    
    @State var selection: String = "떱떱해"
    @State var spaceID: String = ""
    @State var isPresented: Bool = false // Space 입장 ID 입력 Sheet
    @State var isSpaceView: Bool = false
    @State private var naviSelection: String? = nil // tag - profile: 로 전환, alert: 로 전환, create: 로 전환
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var currentUser: User
    
    var body: some View {
        
//        if isSpaceView == true {
//            SpaceMainView(spaceID: $spaceID)
//        }
//        else {
//
//            NavigationView {
                
                ZStack {
                    VStack {
                        HStack {
                            HStack {
                                
                                NavigationLink(destination: ProfileView(),
                                               tag: "profile",
                                               selection: $naviSelection){EmptyView()}
                                Button {
                                    self.naviSelection = "profile"
                                } label: {
                                    currentUser.profileImage
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
                                //                                self.naviSelection = "alert"
                                authViewModel.signOut()
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
                        // 지금 현재 사용 유저의 스페이스 이름이 내가선택한 스페이스이름이랑 같을 때
                        //                        if currentUser.spaceList[0].spaceName == selection {
                        //                            ScrollView(.horizontal, showsIndicators: false) {
                        //                                HStack {
                        //                                    ParticipateDonCard(isParticipateIn: false, isSpaceView: $isSpaceView)
                        //
                        //                                    if currentUser.takeMoney != nil {
                        //                                        TakerDonCard(currentUser: currentUser)
                        //                                    }
                        //                                    if currentUser.giveMoney != nil {
                        //                                        GiverDonCard(currentUser: currentUser)
                        //                                    }
                        //                                }
                        //                            }
                        
                        // MARK: 여기 수정해야합니다! 빌드만 가능하게 돌려놨어요...
                        if currentUser.spaceList[0] == selection {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ParticipateDonCard(isParticipateIn: false, isSpaceView: $isSpaceView)
                                    
                                    //                                    if currentUser.takeMoney != nil {
                                    if transfers[0].taker != nil {
                                        TakerDonCard(currentUser: currentUser)
                                    }
                                    //                                    if currentUser.giveMoney != nil {
                                    if transfers[0].giver != nil {
                                        //                                        GiverDonCard(currentUser: currentUser)
                                        GiverDonCard(taker: transfers[1], currentUser: currentUser)
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
                                           selection: $naviSelection) { EmptyView()}
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
//            }
//
//        }// else

    }
}


//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView(currentUser: user1)
//    }
