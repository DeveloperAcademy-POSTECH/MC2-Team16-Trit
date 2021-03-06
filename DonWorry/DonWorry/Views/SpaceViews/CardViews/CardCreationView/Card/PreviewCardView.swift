//
//  PreviewCardView.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

import SwiftUI

struct PreviewCardView: View {
    
    let isDecoView: Bool
    var paymentIcon: Image?
    @Binding var bank: String
    @Binding var account: String
    @Binding var color: CardColor
    @Binding var date: Date
    
    @Binding var image: [UIImage]
    
    @Binding var decoCase: DecoCase
    
    var amount: Int
    let accountHolder: String
    let paymentTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            SpaceMainCardView(bank: bank, spaceName: paymentTitle, color: color.color, account: account, index: 0, isParticipated: false, date: date.getStringForMMDD(), paymentIcon: paymentIcon, isDecoView: isDecoView, amount: amount, accountHolder: accountHolder, numOfPpl: 2)
        }
        .padding()
    }
}

// struct PreviewCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewCardView(paymentIcon: Image(systemName: "circle"), account: .constant(" asd"), color: .constant(.black), date: .constant(Date()), image: .constant([UIImage(systemName: "circle")!]), decoCase: .constant(.image))
//    }
// }
