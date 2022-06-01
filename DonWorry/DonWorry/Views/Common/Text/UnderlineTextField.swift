//
//  UnderlineTextField.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/02.
//

import SwiftUI

struct UnderlineTextField: View {
    
    var placeholder: String = "Placeholder"
    var charLimit: Int = 15
    @ObservedObject var textBidingManager = TFManager(limit: 15)
    
    var body: some View {
        VStack {
            HStack {
                TextField(placeholder, text: $textBidingManager.text)
                    .frame(height: 30)
                
                if textBidingManager.text != "" {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.medium)
                        .foregroundColor(Color(.systemGray3))
                        .padding(5)
                        .onTapGesture {
                            withAnimation {
                                self.textBidingManager.text = ""
                            }
                        }
                }
            }
            
            Divider()
                .frame(height: 1)
                .padding(.horizontal, 40)
                .background(Color.blueMain)
            
            HStack {
                Spacer()
                Text("\(textBidingManager.text.count)/\(charLimit)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.trailing)
            }
        }
        .frame(width: 350)
        
    }
}

class TFManager: ObservableObject {
    // FIXME: Text Limit 이 초과되어도 텍스트가 쳐지는 문제
    
    @Published var text = "" {
        // 새로운 값을 할당하기 전에 didSet 함수를 실행하여 글자수를 카운트
        didSet { // 그 변수가 변하면 바로 실행되는 함수...?
            if text.count > charLimit && oldValue.count <= charLimit {
                text = oldValue
            }
        }
    }
    
    let charLimit: Int
    
    init(limit: Int = 15) {
        charLimit = limit
    }
    
}

struct UnderlineTextField_Previews: PreviewProvider {
    static var previews: some View {
        UnderlineTextField()
    }
}
