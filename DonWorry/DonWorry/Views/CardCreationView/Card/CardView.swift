//
//  CardView.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/02.
//

import SwiftUI

struct CardView: View {
    
    var color: Color
    var account: String
    var date: Date

    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text("1차 고깃집 파티~")
                Spacer()
                Text("총 130,000원 (6명)")
                Spacer()
                Text("우리은행")
                Text(account)
            }
            .frame(width: 210)
            .padding(20.0)
            .background(color)
            .opacity(0.71)
            
            VStack(alignment: .trailing) {
                Text("애셔")
                Spacer()
                Text("05/22")
            }
            .frame(width: 50)
            .padding(20.0)
            .background(color)
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(width: 300, height: 200)
    }
}

// struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(color: .yellow)
//    }
// }
