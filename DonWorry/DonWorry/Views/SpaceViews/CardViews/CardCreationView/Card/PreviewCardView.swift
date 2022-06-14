//
//  PreviewCardView.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

import SwiftUI

struct PreviewCardView: View {
    
    var paymentIcon: Image?
    @Binding var bank: String
    @Binding var account: String
    @Binding var color: CardColor
    @Binding var date: Date
    
    @Binding var image: [UIImage]
    
    @Binding var decoCase: DecoCase
    
    var body: some View {
        VStack(alignment: .leading) {

            SpaceMainCardView(bank: bank, color: color.color, account: account, index: 0, isParticipated: false, date: date.getStringForMMDD(), paymentIcon: paymentIcon)
        }
        .padding()
    }
}

// struct PreviewCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewCardView(paymentIcon: Image(systemName: "circle"), account: .constant(" asd"), color: .constant(.black), date: .constant(Date()), image: .constant([UIImage(systemName: "circle")!]), decoCase: .constant(.image))
//    }
// }
