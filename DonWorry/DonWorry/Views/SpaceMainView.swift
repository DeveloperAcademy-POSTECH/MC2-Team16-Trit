//
//  SpaceMainView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/02.
//

import SwiftUI

//MARK: - navigationBarBackButtonHidden = true ? 처음 화면이라.
//MARK: - naviagationTitle left padding ? 현재 8.
//MARK: - 글자수
//카드크기?
let colors = [Color(hex: "ff5454"), Color.green, Color.purple]
struct SpaceMainView: View {
    let leftPaddingSize: CGFloat = 25
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                
                ScrollView {
                    HStack {
                        Text("Space ID : 213d42s3s5")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .padding(.leading, leftPaddingSize)
                        Button {
                            print("fg")
                        } label: {
                            Text("복사하기")
                                .font(.system(size: 9, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 47, height: 19)
                                .padding(3)
                                .background(Color.grayC5)
                                .cornerRadius(25)
                        }
                        Spacer()
                        Button {
                            print("df")
                        } label: {
                            Text("정산추가")
                                .foregroundColor(.blueMain)
                                .bold()
                                .frame(width: 92, height: 26)
                                .padding(.horizontal, 3)
                                .padding(.vertical, 4)
                                .background(Color(hex: "#DFEAFF"))
                                .cornerRadius(16)
                                .padding(.trailing, leftPaddingSize)
                        }
                    }
                    .padding(.vertical, 21)
                    
//                    LazyVGrid(columns: [GridItem(.adaptive(minimum: .infinity))], spacing: 24) {
                    LazyVGrid(columns: [GridItem(.fixed(340.0))], spacing: 24) {
                        ForEach(0 ..< 5) { index in
                            if index == 4 {
                                ZStack(alignment: .center) {
                                    
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color.grayBC)
                                        .frame(height: 127)
                                        .shadow(radius: 2)
                                    VStack(spacing: 10) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(Font.system(size: 36, weight: .ultraLight))
                                            .foregroundColor(Color(hex: "#1c6bff"))
                                            .foregroundColor(.blueMain)
                                        Text("정산 시작")
                                            .foregroundColor(Color(hex: "#1c6bff"))
                                    }
                                }.padding(.bottom, 70)
                                
                            } else {
                                
                                RoundedRectangle(cornerRadius: 20)
                                
                                    .fill(colors[index%3])
                                    .frame(height: 216)
                                    .shadow(radius: 5)
                                
                                    .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.white, lineWidth: 1)
                                            )
                                    .overlay {
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text("1차 고기집 파티~")
                                                    .font(.system(size: 15, weight: .heavy))
                                                    .padding(.horizontal, 25)
                                                    .padding(.vertical, 25)
                                                    .foregroundColor(.white)
                                                    
                                                Spacer()
                                                HStack(spacing:4){
                                                    Image("chicken-leg")
                                                        .resizable()
                                                        .frame(width: 27, height: 23)
                                                        .padding(10)
                                                        .background(Color.grayEE)
                                                        .cornerRadius(8)
                                                        .padding(.leading, 25)
                                                }
                                                
                                                Spacer()
                                                
                                                Text("우리은행")
                                                    .padding(.horizontal, 25)
                                                    .padding(.top)
                                                Text("429 - 910 - 10090307")
                                                
                                                    .padding(.horizontal, 25)
                                                    .padding(.bottom, 16)
                                                    
                                            }
                                            
                                            .background(.yellow)
                                            Spacer()
                                            VStack(alignment: .trailing) {
                                                Spacer()
                                                Text("fsdsdsf")
                                                    
                                                Text("fddf").padding(.bottom, 16)
                                                    
                                            }
                                            
                                            .background(.blue)
                                            
//                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        
                                        .background(.purple)
                                        
                                        
                                    }
                                
                            }
                        }
                    }
                    .padding(.horizontal, leftPaddingSize)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            
            HStack(spacing: 25) {
                Button(action: {print("f")}, label: {
                    HStack {
                        Text("링크 공유 ")
                            .font(.body)
                            .bold()
                            .foregroundColor(.white)
                        Image(systemName: "square.and.arrow.up")
                            .font(Font.system(size: 17, weight: .light))
                            
                    }
                    
                    .frame(width: 125, height: 25, alignment: .center)
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .bold))
                    .padding()
                    .background(Color.blueMain)
                    .cornerRadius(25)
                    .overlay(
                                RoundedRectangle(cornerRadius:25)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                })
                
                Button(action: {print("f")}, label: {
                    HStack {
                        Text("참석 확인")
                            .font(.body)
                            .bold()
                            .foregroundColor(.blueMain)
                           
                        Image(systemName: "checkmark")
                            .font(Font.system(size: 17, weight: .light))
                    }
                    .frame(width: 125, height: 25, alignment: .center)
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .bold))
                    .padding()
                    .background(Color(hex: "#A4C6FF"))
                    .cornerRadius(25)
                    .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                })
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Text("MC2 첫 회식")
                    .font(.system(size: 20, weight: .heavy))
                   
                    .padding(.leading, 8)
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                HStack(spacing: leftPaddingSize) {
                        Button {
                            print("1")
                        } label: {
                            Text("...")
                                .font(.title)
                                .bold()
                        }
                        Button {
                            print("2")
                        } label: {
                            Text("x")
                                .font(.title)
                                .bold()
                        }.padding(.trailing, 8)

                    }
                        }
        }
    }
}

struct SpaceMainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SpaceMainView()
            }
            NavigationView {
                SpaceMainView()
            }
            .previewDevice("iPhone 8")
        }
        
    }
}
