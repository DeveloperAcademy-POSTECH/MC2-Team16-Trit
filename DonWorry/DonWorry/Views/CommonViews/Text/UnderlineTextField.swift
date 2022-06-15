//
//  UnderlineTextField.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/02.
//

import Combine
import SwiftUI

struct UnderlineTextField: View {
    let placeholder: String
    let charLimit: Int
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                TextField(placeholder, text: $text)
                    .frame(height: 30)
                    .textInputAutocapitalization(.never)
                    .onReceive(Just(text), perform: { _ in
                        if charLimit < text.count {
                            text = String(text.prefix(charLimit))
                        }
                    })
                
                if !text.isEmpty {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.medium)
                        .foregroundColor(Color(.systemGray3))
                        .padding(5)
                        .onTapGesture {
                            withAnimation {
                                text.removeAll()
                            }
                        }
                }
            }
            
            Divider()
                .frame(height: 1)
                .padding(.horizontal, 40)
                .background(.blue)
            
            HStack {
                Spacer()
                Text("\(text.count)/\(charLimit)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.trailing)
            }
        }
        .frame(width: 350)
    }
}


struct UnderlineTextField_Previews: PreviewProvider {
    static var previews: some View {
        UnderlineTextField(placeholder: "testPlaceHolder", charLimit: 10, text: .constant("야야얀"))
    }
}

