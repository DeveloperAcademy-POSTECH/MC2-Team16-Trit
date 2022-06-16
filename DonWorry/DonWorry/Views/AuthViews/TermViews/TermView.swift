//
//  ToSView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import SwiftUI

struct TermView: View {
    @EnvironmentObject var vm: UserStateViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var showSheet = false
    
    var isDisable: Bool {
        !termsOfService.filter { $0.isEssential }.allSatisfy { $0.isChecked }
    }
    
    @State private var termsOfService = [
        Term(title: "만 14세 이상입니다.", content: "만 14세 이상입니다. 내용", isEssential: true, isChecked: false, showContent: false),
        Term(title: "돈워리 서비스 이용약관 동의", content: "돈워리 서비스 이용약관 동의 내용", isEssential: true, isChecked: false, showContent: false),
        Term(title: "돈워리 개인정보 수집 및 이용 동의", content: "돈워리 개인정보 수집 및 이용 동의 내용", isEssential: true, isChecked: false, showContent: false),
        Term(title: "돈워리 개인정보 제 3자 제공 동의", content: "돈워리 개인정보 제 3자 제공 동의 내용", isEssential: false, isChecked: false, showContent: false),
        Term(title: "이벤트 알림 수신 동의", content: "이벤트 알림 수신 동의 내용", isEssential: false, isChecked: false, showContent: false)
    ]
    
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
            .font(.system(size: 23, weight: .heavy))
            .padding()
            
            ScrollView {
                HStack {
                    Button {
                        let isAllChecked = termsOfService.allSatisfy { $0.isChecked }
                        for i in 0..<termsOfService.count {
                            withAnimation {
                                if isAllChecked {
                                    // 모두 체크되어있으면 다 빼기
                                    termsOfService[i].isChecked = false
                                    
                                } else {
                                    // 하나라도 체크 안되어있으면 모두 체크하기
                                    termsOfService[i].isChecked = true
                                }
                            }
                        }
                    } label: {
                        
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(termsOfService.allSatisfy { $0.isChecked } ? Color.blueMain : Color.grayE7)
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
            
            SmallButton(text: "확인", isDisable: isDisable) {
                showSheet = true
                    
//                Todo : 회원가입 완료 후 메인 페이지로 넘어가기
            }
            .padding(.bottom)
            .disabled(isDisable ? true : false)
        }
        .padding(.horizontal, 15)
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Text("돈워리 이용약관")
                    .font(.system(size: 20, weight: .heavy))
            }
        }
        .halfSheet(showSheet: $showSheet) {
            TermSheetView(agreedTerms: termsOfService.filter { $0.isChecked }, showSheet: $showSheet)
                .environmentObject(vm)
        } onEnd: {
            showSheet = false
        }
    }
}

struct TermView_Previews: PreviewProvider {
    static var previews: some View {
        TermView()
    }
}
