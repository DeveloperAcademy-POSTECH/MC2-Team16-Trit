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
    let maxLength: Int
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                TextField(placeholder, text: $text)
                    .frame(height: 30)
                    .textInputAutocapitalization(.never)
                    .onReceive(Just(text), perform: { _ in
                        if maxLength < text.count {
                            text = String(text.prefix(maxLength))
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
                Text("\(text.count)/\(maxLength)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.trailing)
            }
        }
        .frame(width: 350)
    }
}
