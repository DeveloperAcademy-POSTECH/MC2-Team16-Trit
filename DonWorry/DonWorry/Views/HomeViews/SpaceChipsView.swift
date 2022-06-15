//
//  SpaceChipsView.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/03.
//

import SwiftUI

struct SpaceChipsView: View {
    
    func widthForText(_ spaceName: String) -> CGFloat {
        let string = spaceName
        return string.widthOfString(font: .systemFont(ofSize: 13, weight: .bold))
    }
    
    @Binding var selection: String
    let screen = UIScreen.main.bounds
    var al = 23
    let switches = ["MC2 트라잇 모임", "MC2 번개모임", "밤샘코딩", "떱떱해모임", "MC2 그룹회식"]
    var body: some View {
        VStack {
            VStack {
                // LazyGirdView는 contents가 5개일때 아래 두개의 버튼을 가운데 정렬해주지 않음
                // 우선 버튼이 최대 5개라고 해서 리스트의 앞에서부터 3개를 Hstack으로 쌓고
                // 아래에 2개의 버튼을 가운데에 쌓는식으로 구성
                HStack {
                ForEach(0..<3) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 112, height: 45)
                            .foregroundColor(selection == switches[index] ? .blue : Color(hex: "EFEFEF"))
                        Text(switches[index])
                            .font(.system(size: widthForText(switches[index]) < 80 ? 13 : 12, weight: .bold))
                            .frame(width: 80, height: 24, alignment: .center)
                            .foregroundColor(selection == switches[index] ? .white : .black)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(widthForText(switches[index]) < 80 ? 1 : 0.8)
                        }
                        .onTapGesture {
                            selection = switches[index]
                        }
                    }
                }
                HStack {
                    ForEach(3..<5) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 112, height: 45)
                            .foregroundColor(selection == switches[index] ? .blue : Color(hex: "EFEFEF"))
                        Text(switches[index])
                            .font(.system(size: widthForText(switches[index]) < 80 ? 13 : 12, weight: .bold))
                            .frame(width: 80, height: 24, alignment: .center)
                            .foregroundColor(selection == switches[index] ? .white : .black)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(widthForText(switches[index]) < 80 ? 1 : 0.8)
                        }
                        .onTapGesture {
                            selection = switches[index]
                        }
                    }
                }
            }
        }
    }
}

struct SpaceChipsView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceChipsView(selection: .constant("떱떱해"))
    }
}
