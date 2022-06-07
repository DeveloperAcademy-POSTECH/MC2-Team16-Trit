//
//  PreviewCardView.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

import SwiftUI

struct PreviewCardView: View {
    
    var paymentIcon: Image?
    
    @Binding var account: String
    @Binding var color: CardColor
    @Binding var date: Date
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM / dd"
        return formatter
    }
    @Binding var image: [UIImage]
    
    @Binding var decoCase: DecoCase
    
    var body: some View {
        VStack(alignment: .leading) {

            SpaceMainCardView(color: color.color, account: account, index: 0, clicked: {
                
            }, isParticipated: false, date: dateFormatter.string(from: date), paymentIcon: paymentIcon)
        }
        .padding()
    }
}

 struct PreviewCardView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewCardView(paymentIcon: Image(systemName: "circle"), account: .constant(" asd"), color: .constant(.black), date: .constant(Date()), image: .constant([UIImage(systemName: "circle")!]), decoCase: .constant(.image))
    }
 }
