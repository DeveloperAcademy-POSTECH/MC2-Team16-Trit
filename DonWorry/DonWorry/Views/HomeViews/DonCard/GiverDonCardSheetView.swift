//
//  GiverDonCardSheetView.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/09.
//

import SwiftUI

struct GiverDonCardSheetView: View {
    @Binding var isShowing: Bool
    @State private var isDragging = false
    @State private var curHeight: CGFloat = 500
    let minHeight: CGFloat = 500
    let maxHeigth: CGFloat = 700
    let startOpacity: CGFloat = 0.4
    let endOpacity: CGFloat = 0.8
    
    var currentUser: User
    
    var dragPercentage: Double {
        let res = Double((curHeight - minHeight) / (maxHeigth - minHeight))
        return max(0, min(1, res))
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(startOpacity + (endOpacity - startOpacity) * dragPercentage)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                TakerCardDetailView
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
    }
    
    var TakerCardDetailView: some View {
        VStack {
            ZStack {
                Capsule()
                    .frame(width: 60, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.00001))
            .gesture(dragGesture)
            ZStack {
                VStack {
                    VStack {
                        HStack {
                            Text("애셔")
                                .font(.system(size: 20, weight: .bold))
                            Spacer()
                        }
                        HStack(alignment: .bottom) {
                            Text("102000원")
                                .font(.system(size: 30, weight: .heavy))
                                .offset(y: 3)
                            Spacer()
                        }
                        HStack {
                            Text("우리은행 1203-1489184-14143134")
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.grayBC)
                            Spacer()
                        }
                        Spacer().frame(height: 27)
                    }
                    .padding(.horizontal, 30)
                    ScrollView {
                        HStack {
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.grayBC)
                                Image(systemName: "cart")
                                    .resizable()
                                    .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                            }
                            VStack(alignment: .leading) {
                                Text("우디네 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Text("5/25")
                                    .font(.system(size: 16, weight: .bold))
                                    .opacity(0.4)
                            }
                            Spacer()
                        }
                        HStack {
                            Text("80000원")
                                .font(.system(size: 13))
                            Spacer()
                            Text("102000원")
                                .font(.system(size: 13))
                                .foregroundColor(.gray31)
                                .opacity(0.6)
                        }
                        Spacer().frame(width: 5)
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 335, height: 8)
                                .foregroundColor(.gray31)
                                .opacity(0.2)
                            HStack {
                                // 정산자(taker)가 받아야할 돈(taker.takemoney)과 contentUser가 보내야할돈(contentUser.giveMoney)의 비율을 계산해서 그래프로 표현
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: CGFloat((335*80000)/102000), height: 8)
                                .foregroundColor(.blueMain)
                                Spacer()
                            }
                        }
                        HStack {
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.grayBC)
                                Image(systemName: "cart")
                                    .resizable()
                                    .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                            }
                            VStack(alignment: .leading) {
                                Text("우디네 삼겹살")
                                    .font(.system(size: 16, weight: .bold))
                                Text("5/25")
                                    .font(.system(size: 16, weight: .bold))
                                    .opacity(0.4)
                            }
                            Spacer()
                        }

                        HStack {
                            Text("6000원")
                                .font(.system(size: 13))
                            Spacer()
                            Text("14000원")
                                .font(.system(size: 13))
                                .foregroundColor(.gray31)
                                .opacity(0.6)
                        }
                        Spacer().frame(width: 5)
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 335, height: 8)
                                .foregroundColor(.gray31)
                                .opacity(0.2)
                            HStack {
                                // 정산자(taker)가 받아야할 돈(taker.takemoney)과 contentUser가 보내야할돈(contentUser.giveMoney)의 비율을 계산해서 그래프로 표현
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: CGFloat((335*6000)/14000), height: 8)
                                .foregroundColor(.blueMain)
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal, 25)
                    HStack(spacing: 8) {
                        HalfSheetMediumButton(text: "계좌번호 복사하기", clicked: {
                            //
                        })
                        HalfSheetSmallButton(text: "보냈어요!", clicked: {
                            //
                        })
                    }

                }
            }
            .frame(maxHeight: .infinity)
            .padding(.bottom, 35)
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: curHeight/2)
            }
            .foregroundColor(.white)
        )
        .animation(isDragging ? nil : .easeInOut(duration: 0.45))
        .onDisappear { curHeight = minHeight }
    }
    
    @State private var prevDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if !isDragging {
                    isDragging = true
                }
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeigth || curHeight < minHeight {
                    curHeight -= dragAmount / 6
                } else {
                    curHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = .zero
                isDragging = false
                if curHeight > maxHeigth {
                    curHeight = maxHeigth
                } else if curHeight < minHeight {
                    curHeight = minHeight
                }
            }
    }
}
