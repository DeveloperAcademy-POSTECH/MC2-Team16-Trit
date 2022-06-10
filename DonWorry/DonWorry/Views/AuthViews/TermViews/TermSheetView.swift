//
//  TermSheetView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/05.
//

import SwiftUI

struct TermSheetView: View {
    let agreedTerms: [Term]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }
    @Binding var showSheet: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        Text("\(dateFormatter.string(from: Date())) 알림 수신을")
                        Spacer()
                    }
                    Text("아래와 같이 설정하였습니다.")
                }
                .font(.system(size: 17, weight: .bold))
                
                ForEach(agreedTerms, id: \.self) { term in
                    HStack {
                        Text(term.isEssential ? "(필수)" : "(선택)")
                        Text(term.title)
                    }
                    .font(.system(size: 15))
                    .foregroundColor(Color.grayC5)
                    .padding(.vertical, 10)
                }
                
            }
            .padding()
            .padding(.top, 40)
            
            Spacer()
            
            Button {
                showSheet = false
                
            } label: {
                HStack {
                    Text("확인")
                }
                .frame(width: 100, height: 20, alignment: .center)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold))
                .padding()
                .background(Color.blueMain)
                .cornerRadius(50)
            }
        }
    }
}
/*
struct TermSheetView_Previews: PreviewProvider {
    static var previews: some View {
        TermSheetView(agreedTerms: [
            Term(title: "만 14세 이상입니다.", content: "만 14세 이상입니다. 내용", isEssential: true, isChecked: false, showContent: false),
            Term(title: "돈워리 서비스 이용약관 동의", content: "돈워리 서비스 이용약관 동의 내용", isEssential: true, isChecked: false, showContent: false),
            Term(title: "돈워리 개인정보 수집 및 이용 동의", content: "돈워리 개인정보 수집 및 이용 동의 내용", isEssential: true, isChecked: false, showContent: false),
            Term(title: "돈워리 개인정보 제 3자 제공 동의", content: "돈워리 개인정보 제 3자 제공 동의 내용", isEssential: false, isChecked: false, showContent: false),
            Term(title: "이벤트 알림 수신 동의", content: "이벤트 알림 수신 동의 내용", isEssential: false, isChecked: false, showContent: false)
        ], showSheet: .constant(true))
    }
}
*/
