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
    @State private var naviSelection: String? = nil // tag - profile: 로 전환, alert: 로 전환, create: 로 전환
    @State var currentUser: User = .empty
    @EnvironmentObject var authViewModel: AuthViewModel

    @State private var giverDonCardSheetState = false
    @State private var takerDonCardSheetState = false
    @State private var overMaxSpaceNumber = false

    @FocusState private var isFocused: Bool

    var isDisable: Bool {
        spaceID.isEmpty
    }

    var body: some View {
        ZStack {
            VStack {
                // profileView
                HStack {
                    HStack {
                        NavigationLink(destination: ProfileView(),
                                       tag: "ProfileView",
                                       selection: $naviSelection) { EmptyView() }
                            .isDetailLink(false)

                        Button {
                            self.naviSelection = "ProfileView"
                        } label: {
                            Image(authViewModel.currentUser.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .background(.black)
                                .clipShape(Circle())
                        }
                        VStack(alignment: .leading) {
                            Text(authViewModel.currentUser.userName + "님")
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
                        authViewModel.signOut()
                    } label: {
                        Image("alerticon")
                            .resizable()
                            .frame(width: 42, height: 42)
                    }
                }
                .padding(.bottom, 25)
                .padding(.horizontal, 30)

               
                /* SPACE/CARDVIEW -> 전체 수정 필요
                SpaceChipsView(selection: $selection)
                if authViewModel.currentUser.participant == selection {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ParticipateDonCard(isParticipateIn: false, naviSelection: $naviSelection)

                            if authViewModel.currentUser.takeMoney != nil {

                                Button {
                                    takerDonCardSheetState.toggle()
                                } label: {
                                    TakerDonCard(currentUser: currentUser)
                                }
                                .sheet(isPresented: $takerDonCardSheetState, content: {
                                    TakerDonCardSheet()
                                })

                            }
                            if authViewModel.currentUser.giveMoney != nil {

                                Button {
                                    giverDonCardSheetState.toggle()
                                } label: {
                                    GiverDonCard(currentUser: authViewModel.currentUser)
                                }
                                .sheet(isPresented: $giverDonCardSheetState, content: {
                                    GiverDonCardSheet()
                                })
                            }
                        }
                        .padding(.top,80)
                    }
                } else {
                    ParticipateDonCard(isParticipateIn: true, naviSelection: $naviSelection)
                }
                Spacer()
                */
                 
                 
            }
            .padding(.top)

            NavigationLink(tag: "SpaceMainView",
                           selection: $naviSelection,
                           destination: { SpaceMainView(naviSelection: $naviSelection, spaceID: $spaceID) }, label: { EmptyView() })
            
                .isDetailLink(false)

            VStack {
                Spacer()
                HStack {
                    XSmallButton(icon: "magnifyingglass", clicked: {
                        isPresented = true
                    })

                    NavigationLink(destination: AddSpaceView(naviSelection: $naviSelection),
                                   tag: "AddSpaceView",
                                   selection: $naviSelection) { MediumButton(text: "스페이스 만들기", clicked: {
                        if switches.count == 5 {
                            print("스페이스 최대개수를 초과하셨습니다")
                            overMaxSpaceNumber.toggle()
                        } else {
                            self.naviSelection = "AddSpaceView"
                        }


                    }) }
                        .isDetailLink(false)
                }
                .padding(.bottom)
            }
        }
        .popup(isPresented: $overMaxSpaceNumber, type: .floater(verticalPadding: 10), position: .top, animation: .spring(), autohideIn: 1, closeOnTap: true, closeOnTapOutside: true, view: {
            OverMaxSpaceTopToastMessage()
        })
        .onAppear {
            self.authViewModel.fetchUser()
            UIApplication.shared.hideKeyboard()
        }
        .ignoresSafeArea(.keyboard)
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

                LargeButton(text: "스페이스 참가하기", isDisable: isDisable) {
                    isPresented = false
                    naviSelection = "SpaceMainView"
                }
                .disabled(isDisable ? true : false)
                .padding(.bottom, 30)
            }
            .frame(width: 315, height: 350)
        }
    }
}

/* authviewmodel 이런저런것들
 authViewModel.currentUser.userName
 authViewModel.fetchUser(uid: "CSyRbU7FrCYoVHd22Vp12WlvPQp2")
 authViewModel.deleteUserAccount()
 authViewModel.deleteBankAccount()
*/

/*
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(currentUser: user4)
    }
}
*/
