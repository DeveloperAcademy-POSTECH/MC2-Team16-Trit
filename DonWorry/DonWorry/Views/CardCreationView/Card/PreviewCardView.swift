//
//  PreviewCardView.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

import SwiftUI

struct PreviewCardView: View {
    
    @Binding var account: String
    @Binding var color: CardColor
    @Binding var date: Date
    @Binding var image: [UIImage]
    
    @Binding var decoCase: DecoCase
    
    var body: some View {
        VStack(alignment: .leading) {
            CardView(color: color.color, account: account, date: date)
        }
        .padding()
    }
}

// struct PreviewCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewCardView()
//    }
// }
