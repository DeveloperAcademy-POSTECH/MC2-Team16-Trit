//  SpaceMainCardView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/03.
//
//
import SwiftUI

struct SpaceMainCardView: View {
    
    let bank: String
    let spaceName: String
    var color: Color
    var account: String
    var index: Int = 0
    var isParticipated = false
    let date: String
    var paymentIcon: Image?
    let isDecoView: Bool
    
    
    let amount: Int
    
    let accountHolder: String
    
    var numOfPpl: Int
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter
    }
    
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
                                    //                                    Text("135,800원")
                                    Text("\(numberFormatter.string(for: amount) ?? "")원")
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
                                Image("people_ICON")
                                    .applyClipCircleModifier(width: 30, height: 30)
                                    .padding(.top, 25)
                                
                                Text(accountHolder)
                                    .applyTextWithLineLimitModifier(size: 12, weight: .medium)
                            }
                            
                            ForEach(0..<3) { index in
                                //                                ZStack {
                                
                                Image("people_ICON")
                                    .applyClipCircleModifier(width: 24, height: 24)
                                    .padding(.bottom, -14)

                                // TODO: 4명보다 많으면 땡땡땡이 나타나도록.
                                //                                    if index >= 3 {
                                //                                        Image(systemName: "ellipsis")
                                //                                            .font(.system(size: 6, weight: .medium))
                                //                                            .foregroundColor(color)
                                //                                            .padding(3.5)
                                //                                            .background(Color.grayEE.opacity(0.6))
                                //                                            .clipShape(Circle())
                                //                                            .offset(y: 2)
                                //                                    }
                                
                            }
                            
                            Image(systemName: "ellipsis")
                                .font(.system(size: 6, weight: .medium))
                                .foregroundColor(color)
                                .padding(3.5)
                                .background(Color.grayEE.opacity(0.6))
                                .clipShape(Circle())
                                .offset(y: 10)
                            
                            Spacer()
                            Text(date)
                                .applyTextWithLineLimitModifier(size: 9, weight: .bold, color: color)
                                .applyButtonCustomModifier(backgroundColor: Color.grayEE.opacity(0.6), width: 47, height: 24, padding: 3, cornerRadius: 25, strokeLineWith: 0)
                                .padding(.bottom, 16)
                        }
                        .padding(.trailing, 18)
                    }
                    .blur(radius: isParticipated ? 6 : 0)
                    if isParticipated {
                        Image(systemName: "checkmark.rectangle.fill")
                            .foregroundColor(.white)
                        
                            .font(.system(size: 70))
                    }
                }
        }
    }
}

//struct SpaceMainCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpaceMainCardView(bank: "우리은행",color: .blueMain, account: "429-910-1009307", isParticipated: true, date: "05/25",paymentIcon: Image("chicken-leg"), isDecoView: true)
//    }
//}

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
                Text("\(numOfPpl)명").applyTextWithLineLimitModifier(size: 13.0, weight: .heavy)
                Text("참가 중 ...").applyTextWithLineLimitModifier(size: 13.0, weight: .heavy)
            }.frame(height: 40, alignment: .bottom)
        }
    }
}

/*
 let HardcodedPayments = [
 SpaceMainCardView(bank: "카카오뱅크", spaceName: "왕십리삼겹살", color: Color.blueMain, account: "3333-01-0930532", index: 0, isParticipated: false, date: "06 / 20", paymentIcon: Image("spoon-and-knife"), isDecoView: false, amount: 136000, accountHolder: "Avery"),
 SpaceMainCardView(bank: "우리은행", spaceName: "비룡", color: Color.pink, account: "1002-045-401235", index: 1, isParticipated: false, date: "06 / 20", paymentIcon: Image("spoon-and-knife"), isDecoView: false, amount: 88000, accountHolder: "Asher"),
 SpaceMainCardView(bank: "", spaceName: "순수치킨", color: Color.brown, account: "", index: 2, isParticipated: false, date: "06 / 20", paymentIcon: Image("chicken-leg"), isDecoView: false, amount: 100800, accountHolder: "Isaac"),
 SpaceMainCardView(bank: "", spaceName: "베스킨라빈스", color: Color.green, account: "", index: 3, isParticipated: false, date: "06 / 20", paymentIcon: Image("chocolate-ice-cream"), isDecoView: false, amount: 80000, accountHolder: "Lumi")
 ]
 */
