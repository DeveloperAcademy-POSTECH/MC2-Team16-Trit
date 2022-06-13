//
//  ToSView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

struct TermView: View {

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var showSheet = false
    @State private var termsOfService = terms
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                HStack {
                    Text("돈워리 이용을 위해")
                    Spacer()
                }
                HStack {
                    Text("약관에 동의해주세요.")
                    Spacer()
                }
            }
            .font(.system(size: 17, weight: .heavy))
            .padding()
            
            ScrollView {
                HStack {
                    Button {
                        let isAllChecked = termsOfService.allSatisfy { $0.isAgreed }
                        for i in 0..<termsOfService.count {
                            withAnimation {
                                if isAllChecked {
                                    // 모두 체크되어있으면 다 빼기
                                    termsOfService[i].isAgreed = false
                                    
                                } else {
                                    // 하나라도 체크 안되어있으면 모두 체크하기
                                    termsOfService[i].isAgreed = true
                                }
                            }
                        }
                    } label: {
                        
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(termsOfService.allSatisfy { $0.isAgreed } ? Color.blueMain : Color.grayE7)
                                .padding(.trailing, 5)
                            Text("전체 동의하기")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        .padding()
                        
                    }
                }
                
                ForEach($termsOfService, id: \.self) {
                    TermRowView(term: $0)
                }
            }
            
            Button {
                showSheet = true
                
                // Todo : 회원가입 완료 후 메인 페이지로 넘어가기
                
            } label: {
                HStack {
                    Text("확인")
                }
                .frame(width: 100, height: 20, alignment: .center)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold))
                .padding()
                .background(termsOfService.filter { $0.isEssential }.allSatisfy { $0.isAgreed } ? Color.blueMain : Color.blueA4C6FF )
                .cornerRadius(50)
            }
            .disabled(termsOfService.filter { $0.isEssential }.allSatisfy { $0.isAgreed } ? false : true)
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
//        .halfSheet(showSheet: $showSheet) {
//            TermSheetView(agreedtermsOfService: termsOfService.filter { $0.isAgreed }, showSheet: $showSheet)
//        } onEnd: {
//            showSheet = false
//        }
    }
}

struct TermView_Previews: PreviewProvider {
    static var previews: some View {
        TermView()
    }
}
