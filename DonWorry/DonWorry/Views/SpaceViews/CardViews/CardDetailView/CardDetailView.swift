//
//  CardDetailView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/05.
//
//
import SwiftUI

struct CardDetailView: View {
    
    var body: some View {
        
            VStack(alignment: .leading) {
                
                Group {
                    HStack(alignment: .center, spacing: 10) {
                        Image("chicken-leg")
                            .applyRectangleImageModifier(width: 25, height: 25, background: Color.grayEE.opacity(0.51))
                        Text("유쓰네 택시")
                            .applyTextWithLineLimitModifier(size: 20, weight: .heavy, color: .black)
                        Spacer()
                        Button {
                            print("ecllipsis FUNCTION")
                        } label: {
                            Image(systemName: "ellipsis")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 50)
                    Text("총 102,000원")
                        .applyTextWithLineLimitModifier(size: 30, weight: .heavy, color: .black)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color.grayEE)
                
                Group {
                    Text("정산자")
                        .applyTextWithLineLimitModifier(size: 17, weight: .bold, color: .black)
                        .padding(.top, 20.0)
                        
                    HStack(spacing: 12) {
                        Image("chicken-leg")
                            .applyClipCircleModifier(width: 35, height: 35, background: .black, innerPadding: 5)
                        Text("김유쓰")
                            .applyTextWithLineLimitModifier(size: 17, weight: .regular, color: .black)
                    }
                    .padding(.top, 5)
                    
                    Button {
                        print("계좌번호가 복사되었습니다.")
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("우리은행")
                                    .applyTextWithLineLimitModifier(size: 13, weight: .bold, color: .grayAccount)
                                    .padding(.bottom, 5)
                                HStack {
                                    Text("42991010090307")
                                        .applyTextWithLineLimitModifier(size: 13, weight: .regular, color: .grayAccount)
                                    Text("이한규")
                                        .applyTextWithLineLimitModifier(size: 13, weight: .regular, color: .grayAccount)
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
                    .padding(.top, 3)
                }

                Group {
                    Text("정산 참가자")
                        .applyTextWithLineLimitModifier(size: 17, weight: .bold, color: .black)
                        .padding(.top, 15)
                        .padding(.bottom, 10)
                    
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.fixed(30.0))], spacing: 23) {
                            ForEach(0..<8, id: \.self) { _ in
                                VStack(spacing: 13) {
                                    Image("chicken-leg")
                                        .applyClipCircleModifier(width: 35, height: 35, background: .yellow)
                                    Text("정루미")
                                        .applyTextWithLineLimitModifier(size: 17, weight: .regular, color: .black)
                                    // ToDo: 이름을 몇글자 까지 보여줄 것인지 정하기
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 80)
                }
                
            Spacer()
                
            Group {
                Text("첨부 사진")
                    .applyTextWithLineLimitModifier(size: 17, weight: .heavy, color: .black)
                    .padding(.top, 15)
                LazyHGrid(rows: [GridItem(.fixed(64.0))], spacing: 13) {
                    ForEach(0..<3, id: \.self) { _ in
                        Image("chicken-leg")
                            .applyRectangleImageModifier(width: 44, height: 44, background: Color.grayEE.opacity(0.51), innerPadding: 3, cornerRadius: 5)
                    }
                }
                .frame(height: 64)
            }
        }
        .padding([.leading, .trailing], 25)
    }
    
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView()
    }
}
