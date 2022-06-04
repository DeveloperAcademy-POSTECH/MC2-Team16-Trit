//
//  ToSView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

struct ToSView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var termsOfService = [
        Term(title: "만 14세 이상입니다.", content: "만 14세 이상입니다. 내용", isEssential: true, isChecked: false, showContent: false),
        Term(title: "돈워리 서비스 이용약관 동의", content: "돈워리 서비스 이용약관 동의 내용", isEssential: true, isChecked: false, showContent: false),
        Term(title: "돈워리 개인정보 수집 및 이용 동의", content: "돈워리 개인정보 수집 및 이용 동의 내용", isEssential: true, isChecked: false, showContent: false),
        Term(title: "돈워리 개인정보 제 3자 제공 동의", content: "돈워리 개인정보 제 3자 제공 동의 내용", isEssential: false, isChecked: false, showContent: false),
        Term(title: "이벤트 알림 수신 동의", content: "이벤트 알림 수신 동의 내용", isEssential: false, isChecked: false, showContent: false)
    ]

    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading) {
                Text("돈워리 이용을 위해")
                Text("약관에 동의해주세요.")
            }
            .font(.system(size: 17))
            
            ScrollView {
                HStack {
                    Button {
                        for i in 0..<termsOfService.count {
                            termsOfService[i].isChecked = true
                        }
                    } label: {
                        
                        Text("전체 동의")
                        
                    }
                }
                
                ForEach($termsOfService, id: \.self) {
                    TermView(term: $0)
                }
                
                Button {
                    // Sheet
                } label: {
                    HStack {
                        Text("다음")
                    }
                    .frame(width: 100, height: 20, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .bold))
                    .padding()
                    .background(termsOfService.filter { $0.isEssential }.allSatisfy { $0.isChecked } ? Color.blueMain : Color.blueA4C6FF )
                    .cornerRadius(50)
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Text("돈워리 이용약관")
                    .font(.system(size: 20, weight: .heavy))
            }
        }
    }
    
}

struct ToSView_Previews: PreviewProvider {
    static var previews: some View {
        ToSView()
    }
}
