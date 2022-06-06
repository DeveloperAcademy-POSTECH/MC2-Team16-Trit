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
//MARK: - 카드색깔 + 날짜색깔
//MARK: - Nvigation bar
//MARK: - BottomButton color
//MARK: - Scroll시 카드가 눌리는가..?
//MARK: - SpaceID가 길 경우? TopView
//MARK: - MainCardView Data
//MARK: - CheckAttendanceCardView 글자넘어서지않도록.

struct SpaceMainView: View {
    let leftPaddingSize: CGFloat = 25.0
    let colors = [Color(hex: "ff5454"), Color.green, Color.purple]
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack {
                    Spacer()//필요한가?
                    ScrollView {
                        SpaceTopView(spaceID: "213d42s3s5")
                        //이친구의 width가 크기때문에 scrollview width가 크다.
                        .padding(.vertical, 21)
                        LazyVGrid(columns: [GridItem(.fixed(340.0))], spacing: 24) {
                            ForEach(0..<5) { index in
                                if index == 4 {
                                    SpaceMainCalculateStartButton(clicked: {
                                        print("calculate start FUNCTION")
                                    }) .padding(.bottom, 70)
                                } else {
                                    SpaceMainCardView(index: index) {
                                        print("MainCard FUNCTION")
                                    }
                                }
                            }
                        }
                    }
    //                .background(.brown)
                    .navigationBarTitleDisplayMode(.inline)
                }
                HStack(spacing: 25) {
                    SpaceMainBottomButton(text: "링크 공유", systemImageString: "square.and.arrow.up", backgroundColor: .blueMain, textColor: .white) {
                        print("링크 공유 FUNCTION")
                    }
                    SpaceMainBottomButton(text: "참석 확인", systemImageString: "checkmark", backgroundColor: Color(hex: "#A4C6FF"), textColor: .blueMain) {
                        print("참석 확인 FUNCTION")
                    }
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
                            print("ecllipsis FUNCTION")
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                        Button {
                            print("xmark FUNCTION")
                        } label: {
                            Image(systemName: "xmark")
                        }.padding(.trailing, 8)
                        
                        }
                }
            }
        }
    }
}

struct SpaceMainView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceMainView()
        
    }
}

