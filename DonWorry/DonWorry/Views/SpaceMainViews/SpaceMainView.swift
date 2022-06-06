//
//  SpaceMainView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/02.
//
//
import SwiftUI

struct SpaceMainView: View {
    let leftPaddingSize: CGFloat = 25.0
    let colors = [Color(hex: "ff5454"), Color.green, Color.purple]
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack {
                    Spacer()
                    ScrollView {
                        SpaceTopView(spaceID: "213d42s3s5")
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
                    .navigationBarTitleDisplayMode(.inline)
                }
                HStack(spacing: 25) {
                    SpaceMainBottomButton(text: "링크 공유", systemImageString: "square.and.arrow.up", backgroundColor: .blueMain, textColor: .white) {
                        print("링크 공유 FUNCTION")
                    }
                    SpaceMainBottomButton(text: "참석 확인", systemImageString: "checkmark", backgroundColor: Color(hex: "#A4C6FF"), textColor: .white) {
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

