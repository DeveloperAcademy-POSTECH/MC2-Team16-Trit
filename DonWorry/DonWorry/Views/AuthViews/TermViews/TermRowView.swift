//
//  TermView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

struct TermRowView: View {
    @Binding var term: Term
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    withAnimation {
                        term.isChecked.toggle()
                    }
                } label: {
                    Image(systemName: "circle.fill")
                        .foregroundColor(term.isChecked ? Color.blueMain : Color.grayE7)
                        .padding(.trailing, 5)
                }
                
                Group {
                    Text(term.isEssential ? "(필수)" : "(선택)")
                    Text(term.title)
                }
                .font(.system(size: 15))
                .foregroundColor(Color.gray81)
                
                Spacer()
                
                Button {
                    withAnimation {
                        term.showContent.toggle()
                    }
                } label: {
                    Image(systemName: term.showContent ? "chevron.up" : "chevron.down")
                        .foregroundColor(Color.gray81)
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .padding(.vertical, 5)
            
            if term.showContent {
                Text(term.content)
            }
        }
    }
}
