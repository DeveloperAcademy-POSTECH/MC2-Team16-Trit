//
//  SpaceMainCardView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/03.
//
//
import SwiftUI

struct SpaceMainCardView: View {
    var color: Color
    var account: String
    var index: Int = 0
    var clicked: () -> Void
//    let colors = [Color(hex: "ff5454"), Color.green, Color.purple]
    var isParticipated = false
    let date: String
    var body: some View {
        
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(width: 340, height: 216)
                .frame(width: 100, alignment: .trailing)
                .clipped()
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .opacity(0.72)
                .frame(width: 340, height: 216)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 1)
                )
                .overlay {
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("1차 고기집 파티~")
                                .applyTextWithLineLimitModifier(size: 15, weight: .heavy, color: .white)
                                .padding(.horizontal, 25)
                                .padding(.vertical, 25)
                                
                            Spacer()
                            HStack(spacing: 8) {
                                Image("chicken-leg")
                                    .applyRectangleImageModifier(width: 27, height: 23, background: .grayEE, innerPadding: 8)
                                    .padding(.leading, 25)
                                Text("총 135,800원(4명)")
                                    .applyTextWithLineLimitModifier(size: 18.0, weight: .heavy)
                            }
                            Spacer()
                            Text("우리은행")
                                .applyTextWithLineLimitModifier(size: 13.0, weight: .heavy)
                                .padding(.horizontal, 25)
                                .padding(.vertical, 5)
                         
                            HStack(alignment: .firstTextBaseline) {
                                Text(account)
                                    .applyTextWithLineLimitModifier(size: 13, weight: .medium)
                                Spacer()
                                
                                Button {
                                    print("copy!")
                                } label: {
                                    Image(systemName: "doc.on.doc")
                                        .font(Font.system(size: 15, weight: .medium))
                                        .foregroundColor(.white)
                                        
                                }
                                .padding(.trailing, 50)
                            }
                            .padding(.leading, 25)
                            .padding(.bottom, 16)
                        }
                        //                                            .background(.yellow)//BACKGROUND
                        Spacer()
                        VStack {
                            VStack(spacing: 2) {
                                Image("chicken-leg")
                                    .applyClipCircleModifier(width: 30, height: 30, background: .clear, innerPadding: 3)
                                    .padding(.top, 25)
                                Text("한규")
                                    .applyTextWithLineLimitModifier(size: 12, weight: .medium)
                            }
                            ForEach(0..<4) { _ in
                                
                                Image("chicken-leg")
                                    .applyClipCircleModifier(width: 24, height: 25, background: .clear, innerPadding: 0)
                                    .padding(.bottom, -17)
                            }
                            Spacer()
                            Text(date)
                                .applyTextWithLineLimitModifier(size: 9, weight: .bold, color: color)
                                .applyButtonCustomModifier(backgroundColor: Color.grayEE.opacity(0.6), width: 47, height: 24, padding: 3, cornerRadius: 25, strokeLineWith: 0)
                                .padding(.bottom, 16)
                        }
                        .padding(.trailing, 24)
                        //                                            .background(.blue)//BACKGROUND
                    }
                    .blur(radius: isParticipated ? 3 : 0)
                    Image(systemName: isParticipated ? "checkmark" : "")
                        .foregroundColor(.white)
                        .font(.system(size: 70))
                    //                                        .background(.purple)//BACKGROUND
                }
        }
        .onTapGesture {
            print("df")
        }
    }
}

struct SpaceMainCardView_Previews: PreviewProvider {
    static var previews: some View {
//        SpaceMainCardView(clicked: {})
        SpaceMainCardView(color: .blueMain, account: "42991010093007", clicked: {
            print("f")
        }, date: "06/26")
    }
}

struct FilledButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(isEnabled ? Color.accentColor : .gray)
            .cornerRadius(8)
    }
}