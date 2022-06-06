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
    let date: String

    @Binding var image: [UIImage]
    
    @Binding var decoCase: DecoCase
    
    var body: some View {
        VStack(alignment: .leading) {

            SpaceMainCardView(color: color.color, account: account, index: 0, clicked: {
                
            }, isParticipated: false, date: date)
        }
        .padding()
    }
}

// struct PreviewCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewCardView()
//    }
// }
