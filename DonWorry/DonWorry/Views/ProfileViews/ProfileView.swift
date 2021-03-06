//
//  ProfileView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/02.
//
import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var nickName = "동에번쩍"
    var userName = "홍길동"
    var bankAccountBank: String = "사과은행"
    var bankAccountNumber: String = "0000000000000000"
    var bankAccountHolder: String = "홍길동"
    var profileImage = "people_ICON"
    
    @State private var deleteAccount = false
    @State private var showLogOutAlert = false // 스페이스 나가기 시 Alert를 보여주기 위한 변수
    
    var body: some View {
        ZStack {
            VStack {
                /* Main Content */
                VStack {
                    /* Section 1 :  Profile */
                    HStack {
                        Image(profileImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .background(.black)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("김유스 님")
                                .font(.system(size: 20, weight: .bold))
                            Text("안녕하세요")
                                .font(.system(size: 17))
                        }
                        .padding(.leading, 10)
                        
                        Spacer()
                        
                        VStack {
                            
                            NavigationLink(destination: EditProfileView()) {
                                Image(systemName: "pencil")
                                    .foregroundColor(Color.black)
                            }
                            
                        }
                    }
                    .padding(.bottom)
                    
                    GrayLine()
                    
                    /* Section 2 : Bank Account */
                    VStack {
                        HStack {
                            Text("나의 계좌")
                                .font(.system(size: 17))
                            Spacer()
                            
                            VStack {
                                
                                NavigationLink(destination: EditAccountView()) {
                                    Image(systemName: "pencil")
                                        .foregroundColor(Color.black)
                                }
                                
                            }
                            
                        }
                        .padding(.bottom, 10)
                        
                        Button {
                            
                            print("계좌번호가 복사되었습니다.")
                            
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(bankAccountBank)
                                        .bold()
                                        .font(.system(size: 13))
                                        .foregroundColor(Color.grayAccount)
                                        .padding(.bottom, 5)
                                    
                                    HStack {
                                        Text(bankAccountNumber)
                                            .font(.system(size: 13))
                                            .foregroundColor(Color.grayAccount)
                                        Text(bankAccountHolder)
                                            .font(.system(size: 13))
                                            .foregroundColor(Color.grayAccount)
                                    }
                                }
                                Spacer()
                                Image(systemName: "doc.on.doc")
                                    .foregroundColor(.grayWithBlue)
                            }
                            .padding(20)
                            .frame(width: 340, height: 90, alignment: .leading)
                            .background(Color.grayF0)
                            .cornerRadius(8)
                        }
                    }
                    .padding(.vertical, 10)
                    GrayLine()
                    
                    /* Section 3 : 공지사항, 이용약관, 1대1문의, 회원탈퇴 */
                    VStack {
                        
                        MoreInfoListItem(title: "공지사항")
                        GrayLine()
                        
                        MoreInfoListItem(title: "1대1문의", subTitle: "불편한점이나 바라는점을 말씀해주세요")
                        GrayLine()
                        
                        MoreInfoListItem(title: "이용약관")
                        GrayLine()
                    }
                    .padding(.bottom, 15)
                    
                }
                Spacer()
                /* Footer */
                HStack {
                    Spacer()
                    Button {
                        // To-Do: 로그아웃 구현
                        print("로그아웃 되었습니다.")
                        showLogOutAlert = true
                    } label: {
                        Text("로그아웃")
                            .font(.system(size: 15))
                            .foregroundColor(Color.gray91)
                    }
                    .padding(.horizontal)
                    
                    Text(" | ")
                    
                    Button {
                        // To-Do: 회원탈퇴 구현
                        deleteAccount = true
                    } label: {
                        Text("회원탈퇴")
                            .font(.system(size: 15))
                            .foregroundColor(Color.gray91)
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .padding(.bottom)
                
                HStack {
                    Spacer()
                    Text("돈워리 ver 1.0.0")
                        .font(.system(size: 15))
                        .foregroundColor(Color.gray91)
                    Spacer()
                }
                .padding(.bottom)
                
            }
            .padding(.top, -20)
            .navigationBarBackButtonHidden(true)
            .padding(.horizontal, 25)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Text("내 정보")
                        .font(.title2.weight(.bold))
                        .padding(.trailing)
                }
            }
        }
        .alert("회원탈퇴를 하시겠어요?", isPresented: $deleteAccount, actions: {
            Button("확인", action: {
                // 회원탈퇴 기능 구현
                print("회원탈퇴 되었습니다.")
            })
            Button("취소", role: .cancel, action: {
            }).keyboardShortcut(.defaultAction)
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
    }
}

struct MoreInfoListItem: View {
    
    var title: String = ""
    var subTitle: String = ""
    
    var body : some View {
        
        Button {
            print(title)
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 17))
                        .foregroundColor(Color.black)
                    
                    if !subTitle.isEmpty {
                        Text("불편한점이나 바라는점을 말씀해주세요")
                            .foregroundColor(.grayC5)
                            .font(.system(size: 12))
                    }
                }
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.grayWithBlue)
            }
        }
        .padding(.vertical, !subTitle.isEmpty ? 10 : 15)
        
    }
    
}
