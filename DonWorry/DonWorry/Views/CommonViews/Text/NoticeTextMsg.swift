//
//  NoticeMsg.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/02.
//

import SwiftUI

struct NoticeMsg: View {
    
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
        }
        .frame(width: 328, height: 28, alignment: .leading)
        .foregroundColor(Color.gray4E)
        .font(.system(size: 12, weight: .medium))
        .padding()
        .background(Color.grayF2F3F5)
        .cornerRadius(20)
    }
}

/*
struct NoticeMsg_Previews: PreviewProvider {
    static var previews: some View {
        NoticeMsg(
            text: "스페이스를 만들거나, 검색하여 정산을 시작하세요!"
        )
    }
}
 */
