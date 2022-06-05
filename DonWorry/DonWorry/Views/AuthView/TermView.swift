//
//  TermView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

struct TermView: View {
    @Binding var term: Term
    
    var body: some View {
        
        VStack {
            HStack {
                Button {

                    term.isChecked.toggle()
                     
                } label: {
                    Image(systemName: "circle.fill")
                        .foregroundColor(term.isChecked ? Color.blueMain : Color.grayE7)
                }
                
                Text(term.isEssential ? "(필수)" : "(선택)")
                Text(term.title)
                
                Spacer()
                
                Button {

                    withAnimation {
                        term.showContent.toggle()
                    }
                    
                } label: {
                    
                    Image(systemName: term.showContent ? "chevron.up" : "chevron.down")
                        .foregroundColor(.black)
                }
     
                }
            .frame(maxWidth: .infinity)
            .padding()
            
            if term.showContent {
                Text(term.content)
            }
        }
    }
}
