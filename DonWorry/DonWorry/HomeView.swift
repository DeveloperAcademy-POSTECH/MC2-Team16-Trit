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
    @State var isPresented : Bool = false
    @State var spaceID: String = ""
    
    var currentUser: User
    var body: some View {
        ZStack {
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
                
                /* Bottom Buttons */
                HStack {
                    XSmallButton(icon: "magnifyingglass") {
                        isPresented.toggle()
                    }
                    MediumButton(text: "스페이스 만들기") {
                        // Create Space
                    }
                }
                .offset(y: 160)
                
                Spacer().frame(height: 120)
            }
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
                }.padding(.bottom, 30)
            }
            .frame(width: 315, height: 350)
        }
        
    }
}

//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView(currentUser: user1)
//    }
//}
//
