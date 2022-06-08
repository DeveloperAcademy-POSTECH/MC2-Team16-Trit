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
    var profileImage = "blue-car"
        
    var body: some View {
        
        VStack {
            
            /* Title */
            HStack {
                Text("내 정보")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
//                    .padding(.bottom, 10)
                Spacer()
            }
            
            Spacer()
            
            /* Main Content */
            VStack {
                /* Section 1 :  Profile */
                HStack {
                    Image(profileImage)
                        .resizable()
                        .background(.gray)
                        .frame(width: 65, height: 65)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("김유쓰")
                            .bold()
                            .font(.system(size: 22))
                            
                        Text("김의성")
                            .fontWeight(.light)
                            .font(.system(size: 16))
                    }
                    .padding(.leading, 5)
                    
                    Spacer()
                    
                    VStack {
                        
                        NavigationLink(destination: EditProfileView()) {
                            Image(systemName: "pencil")
                                .foregroundColor(Color.black)
                        }
                        
                    }
                }
                
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
                    
                    MoreInfoListItem(title: "이용약관")
                    GrayLine()
                    
                    MoreInfoListItem(title: "1대1문의", subTitle: "불편한점이나 바라는점을 말씀해주세요")
                    GrayLine()
                                       
                    MoreInfoListItem(title: "회원탈퇴")
                    GrayLine()
                    
                }
                .padding(.bottom, 15)
                     
            }
            
            /* Footer */
            HStack {
                Spacer()
                Text("돈워리 ver 1.0.0")
                    .font(.system(size: 15))
                    .foregroundColor(Color.gray91)
                Spacer()
            }
            
            Spacer()
            
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
                }
            }
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
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
