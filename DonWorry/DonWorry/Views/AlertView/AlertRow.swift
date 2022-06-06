//
//  AlertRow.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/06.
//

import SwiftUI

struct AlertRow: View {
    
    var isReminder: Bool = false

    var body : some View {
        HStack {
            
            HStack {
                HStack {
                    // Image Goes Here
                    Image(isReminder
                          ? "cash-and-coins" : "calculator")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 45, height: 45)
                .background(Color.grayEE)
                .cornerRadius(15)
                .padding(.horizontal, 5)
                .padding(.trailing, 5)
                
                VStack(alignment: .leading) {
                    Text("1차 고깃집 파티~")
                        .font(.system(size: 15, weight: .heavy))
                        .padding(.bottom, 0.2)
                    
                    Text("김애셔님이 정산을 시작하셨습니다")
                        .foregroundColor(Color.gray75)
                        .font(.system(size: 10))
                    
                }
            }
            
            Spacer()
            
            if isReminder == true {
                HStack {
                    Button(action: {
                        print("정산하기 버튼이 눌렸다")
                    }){
                        Text("정산하기")
                            .font(.system(size: 10, weight: .heavy))
                            .foregroundColor(Color.white)
                    }
                }
                .frame(width: 70, height: 30)
                .background(Color.skyBlue)
                .cornerRadius(15)
            } else {
                // empty
            }
            
        }.padding(.bottom, 12)
    }
}

struct AlertRow_Previews: PreviewProvider {
    static var previews: some View {
        AlertRow()
    }
}
