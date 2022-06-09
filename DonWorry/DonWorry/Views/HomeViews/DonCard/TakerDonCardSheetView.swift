//
//  TakerDonCardSheetView.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/09.
//

import SwiftUI

struct TakerDonCardSheetView: View {
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
                            Text("받을돈")
                                .font(.system(size: 20, weight: .bold))
                            Spacer()
                        }
                        HStack(alignment: .bottom) {
                            Text("18000원")
                                .font(.system(size: 30, weight: .heavy))
                                .offset(y: 3)
                            Text("/ 12000원")
                                .font(.system(size: 20, weight: .heavy))
                            Spacer()
                        }
                        Spacer().frame(height: 27)
                    }
                    .padding(.horizontal, 30)
                    ScrollView {
                        HStack {
                            Text("미정산 내역")
                                .font(.system(size: 15))
                            Spacer()
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

                            HStack {
                                Text("루미네 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Spacer()
                                Text("12000원")
                                    .font(.system(size: 16, weight: .bold))

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

                            HStack {
                                Text("루미네 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Spacer()
                                Text("12000원")
                                    .font(.system(size: 16, weight: .bold))

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

                            HStack {
                                Text("루미네 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Spacer()
                                Text("12000원")
                                    .font(.system(size: 16, weight: .bold))

                            }
                        }
                        
                        HStack {
                            Text("정산 완료 내역")
                                .font(.system(size: 15))
                            Spacer()
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

                            HStack {
                                Text("루미네 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Spacer()
                                Text("12000원")
                                    .font(.system(size: 16, weight: .bold))

                            }
                        }
                        .opacity(0.1)
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

                            HStack {
                                Text("루미네 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Spacer()
                                Text("12000원")
                                    .font(.system(size: 16, weight: .bold))

                            }
                        }
                        .opacity(0.1)
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

                            HStack {
                                Text("루미네 당구장")
                                    .font(.system(size: 16, weight: .bold))
                                Spacer()
                                Text("12000원")
                                    .font(.system(size: 16, weight: .bold))

                            }
                        }
                        .opacity(0.1)
                    }
                    .padding(.horizontal, 30)
                    LargeButton(text: "정산재촉하기", clicked: {
                        isShowing = false
                    })

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
