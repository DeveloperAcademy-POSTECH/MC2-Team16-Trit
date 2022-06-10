//
//  SpaceEmptyView.swift
//  SpaceView
//
//  Created by 김승창 on 2022/06/01.
//

import SwiftUI

struct SpaceEmptyView: View {
    @State private var spaceTitle: String = "MC2 첫 회식"
    @State private var spaceID: String = "213d42s3s5"
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack {
                    
                    HStack {
                        Text(spaceTitle)
                            .font(.system(size: 20, weight: .heavy))
                        
                        Spacer()
                                  
                        Button {
                            // Todo : 스페이스 이름 수정
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                        
                        Button {
                            // Todo : 스페이스 삭제
                        } label: {
                            Image(systemName: "xmark")
                        }
                        
                    }
                    .foregroundColor(.black)
                    
                    HStack {
                        // Space ID
                        HStack(spacing: 8) {
                            
                            Text("Space ID : \(spaceID)")
                                .foregroundColor(.secondary)
                            
                            // 복사 버튼
                            Image(systemName: "doc.on.doc")
                            
                        }
                        
                        Spacer()
                        
                        // 정산 추가 버튼
                        NavigationLink(destination: AddCardTitleView()) {
                            Text("정산 추가")
                                .font(.system(size: 15, weight: .bold))
                                .frame(width: 90, height: 35)
                                .background(Color.blue
                                    .opacity(0.14))
                                .cornerRadius(30)
                        }
                    }
                }
                .padding(.top, -30)
                    
                Spacer()
                
                VStack {
                    Image("debit-card")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 138.75)
                          
                    Text("정산추가 버튼을 눌러 정산내역을 추가 해주세요")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .frame(width: 340, height: 62)
                        .background(Color(hex: "F2F3F5"))
                        .cornerRadius(20)
                    
                }
                  
                Spacer()
                 
                HStack {
                    Button {
                        // Todo : 링크 공유 기능 추가
                    } label: {
                        HStack {
                            Text("링크 공유")
                            Image(systemName: "square.and.arrow.up")
                        }
                        .foregroundColor(.white)
                        .frame(width: 162, height: 50)
                        .background(.blue)
                        .cornerRadius(25)
                        
                    }

                    Button {
                        // Todo : 참석 확인 기능 추가
                    } label: {
                        HStack {
                            Text("참석 확인")
                            Image(systemName: "checkmark")
                        }
                        .foregroundColor(.white)
                        .frame(width: 162, height: 50)
                        .background(.blue
                            .opacity(0.4))
                        .cornerRadius(25)
                        
                    }
                }
                .padding(.bottom, 30)
            }
            .padding(.horizontal, 25)
        }
    }
}

struct SpaceEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceEmptyView()
    }
}
