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
        
        ScrollView {
            VStack(alignment: .leading) {
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
                            .foregroundColor(.black)
                    }
                }.padding(.top, 50)
                
                Text("총 102,000원")
                    .applyTextWithLineLimitModifier(size: 30, weight: .heavy, color: .black)
                    .padding(.bottom, 43.5)
                Text("첨부 사진")
                    .applyTextWithLineLimitModifier(size: 17, weight: .heavy, color: .black)
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.fixed(64.0))], spacing: 13) {
                        ForEach(0..<9, id: \.self) { _ in
                            Image("chicken-leg")
                                .applyRectangleImageModifier(width: 44, height: 44, background: Color.grayEE.opacity(0.51), innerPadding: 3, cornerRadius: 5)
                        }
                    }
                    .frame(height: 64)
                }
                
                Text("정산자")
                    .applyTextWithLineLimitModifier(size: 17, weight: .bold, color: .black)
                    .padding(.top, 27.5)
                HStack(spacing: 12) {
                    Image("chicken-leg")
                        .applyClipCircleModifier(width: 35, height: 35, background: .black, innerPadding: 5)
                    Text("김유쓰")
                        .applyTextWithLineLimitModifier(size: 17, weight: .regular, color: .black)
                }
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.grayBC)
                        .frame(width: 340, height: 90)
                        .shadow(radius: 2)
                        .opacity(0.3)
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("우리은행")
                                .applyTextWithLineLimitModifier(size: 15, weight: .heavy, color: .black)
                            Text("1002-045-401235 (임영후)")
                                .applyTextWithLineLimitModifier(size: 13, weight: .medium, color: .black)
                        }
                        Spacer()
                        Button {
                            print("copy!")
                        } label: {
                            Image(systemName: "doc.on.doc")
                                .font(Font.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
                
                Text("정산 참가자")
                    .applyTextWithLineLimitModifier(size: 17, weight: .bold, color: .black)
                    .padding(.top, 35)
                Spacer()
                LazyVGrid(columns: [GridItem(.flexible(minimum: 0, maximum: .infinity))], spacing: 13) {
                    ForEach(0..<13, id: \.self) { _ in
                        HStack(spacing: 12) {
                            Image("chicken-leg")
                                .applyClipCircleModifier(width: 35, height: 35, background: .yellow)
                            
                            Text("정루미")
                            Spacer()
                        }
                    }
                }
                .padding(.top, 20)
            }.padding([.leading, .trailing], 25)
    }
}
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView()
    }
}
