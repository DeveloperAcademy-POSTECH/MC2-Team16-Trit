//
//  SpaceMainCardView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/03.
//
//
import SwiftUI

struct SpaceMainCardView: View {
    
    let bank: String
    let spaceName: String = "고기광"
    var color: Color
    var account: String
    var index: Int = 0
    var isParticipated = false
    let date: String
    var paymentIcon: Image?
    let isDecoView: Bool
    var body: some View {
        
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(width: 340, height: 216)
                .frame(width: 90, alignment: .trailing)
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
                            Text(spaceName)
                                .applyTextWithLineLimitModifier(size: 15, weight: .heavy, color: .white)
                                .padding(.leading, 25)
                                .padding(.vertical, 25)
                            Spacer()
                            HStack(spacing: 8) {
                                paymentIcon.map {
                                    $0.applyRectangleImageModifier(width: 27, height: 27, background: .grayEE, innerPadding: 8)
                                        .padding(.leading, 25)
                                }
                                HStack(alignment: .firstTextBaseline, spacing: 5) {
                                    Text("135,800원")
                                        .applyTextWithLineLimitModifier(lineLimit: 2, size: 20.0, weight: .heavy)
                                    Text("나왔어요.")
                                        .applyTextWithLineLimitModifier(size: 13.0, weight: .medium)
                                }
                                
                            }
                            
                            Spacer()
                            accountView(isDecoView: isDecoView)
                            .padding(.leading, 27)
                            .padding(.bottom, 28)
                            
                        }
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
                        .padding(.trailing, 18)
                    }
                    if isParticipated {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 70))
                    }
                }
        }
    }
}

struct SpaceMainCardView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceMainCardView(bank: "우리은행",color: .blueMain, account: "429-910-1009307",date: "05/25",paymentIcon: Image("chicken-leg"), isDecoView: true)
    }
}

extension SpaceMainCardView {
    @ViewBuilder private func accountView(isDecoView: Bool) -> some View {
        if isDecoView {
            VStack(alignment: .leading, spacing: 3) {
                Text(bank)
                    .applyTextWithLineLimitModifier(size: 13.0, weight: .heavy)
                    .padding(.vertical, 2)
                Text(account)
                    .applyTextWithLineLimitModifier(size: 13, weight: .medium)
            }.frame(height: 40)
        } else {
            HStack {
                Text("현재").applyTextWithLineLimitModifier(size: 13.0, weight: .heavy)
                Text("3명").applyTextWithLineLimitModifier(size: 13.0, weight: .heavy)
                Text("참가 중 ...").applyTextWithLineLimitModifier(size: 13.0, weight: .heavy)
            }.frame(height: 40, alignment: .bottom)
        }
    }
}
