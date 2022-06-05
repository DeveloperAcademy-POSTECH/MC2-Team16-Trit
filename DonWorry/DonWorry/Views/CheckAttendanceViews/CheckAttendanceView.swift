//
//  SpaceMainView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/02.
//

import SwiftUI

//MARK: - MainCardView 사진 37,33 수정
//MARK: - MainCardView 를 AttendanceCardView처럼 겹치는 뷰 방식을 바꾸자
//MARK: - hardcoding 줄이기
//MARK: - MainCarView index let으로 바꾸기.
//MARK: - MainCardView 의미없는 spacer minlength 추가.
//MARK: - 전역변수 card
//MARK: card모양 viewbuilder
struct CheckAttendanceView: View {
    let leftPaddingSize: CGFloat = 25
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer(minLength: 50)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.fixed(340))], spacing: 12) {
                        ForEach(0..<5) { index in
                            HStack(alignment: .center, spacing: 0) {
                                Circle()
                                    .frame(width: 42, height: 42, alignment: .leading)
                                    .foregroundColor(Color.grayEE)
//                                    .background(.red)
                                Spacer()
                                CheckAttendanceCardView(index: index) {
                                    print("card")
                                }.padding(.bottom, index == 4 ? 70 : 0)
                            }
                        }
                    }
                }
            }.navigationBarTitleDisplayMode(.inline)
                
            HStack(spacing: 25) {
                SpaceMainBottomButton(text: "모두 선택", systemImageString: "", backgroundColor: .blueMain, textColor: .white) {
                    print("링크 공유 FUNCTION")
                }
                SpaceMainBottomButton(text: "참석 확인", systemImageString: "", backgroundColor: Color(hex: "#A4C6FF"), textColor: .blueMain) {
                    print("참석 확인 FUNCTION")
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                            Text("참석확인")
                    .applyTextWithLineLimitModifier(size: 20, weight: .medium, color: .black)
//                                .font(Font.custom("AppleSDGothicNeo", size: 20))
//                                .fontWeight(.bold)
                        }
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    print("참석확인")
                } label: {
                    Text("취소")
                        .applyTextWithLineLimitModifier(size: 17, weight: .regular, color: .black)
//                        .foregroundColor(.black)
//                        .font(Font.custom("AppleSDGothicNeo", size: 17))
//                        .fontWeight(.regular)
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                HStack(spacing: 0) {
                    Text("1")
                        .applyTextWithLineLimitModifier(size: 17, weight: .medium, color: .blueMain)
                    Button {
                        print("선택해제")
                    } label: {
                        Text("선택해제")
                            .applyTextWithLineLimitModifier(size: 17, weight: .regular, color: .black)
//                            .foregroundColor(.black)
//                            .font(Font.custom("AppleSDGothicNeo", size: 17))
//                            .fontWeight(.regular)
                            
                    }
                }
            }
        }
    }
}

struct CheckAttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckAttendanceView()
        }
        
    }
}

