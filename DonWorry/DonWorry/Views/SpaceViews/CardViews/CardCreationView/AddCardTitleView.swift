//
//  NewPayment_Title.swift
//  SpaceView
//
//  Created by 김승창 on 2022/06/01.
//

import SwiftUI

struct AddCardTitleView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var mainSelection: String? // SpaceMainView로 돌아가기 위한 변수입니다.
    @State private var paymentTitle: String = ""
    @State private var naviSelection: String? = nil // 다음 페이지로 이동을 위한 일회성의 변수입니다.
    @FocusState private var isFocused: Bool
    
    let maxLength = 15
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 50) {
                VStack(alignment: .leading) {
                    Text("정산 내역을")
                    Text("추가해볼까요?")
                }
                .font(.system(size: 25, weight: .bold))
                .padding(.vertical)
                
                VStack(spacing: 20) {
                    
                    UnderlineTextField(placeholder: "정산하고자 하는 항목을 입력하세요", charLimit: 20, text: $paymentTitle)
                        .keyboardType(.default)
                    
                    Spacer()
                }
            }
            VStack {
                Spacer()
                Image("smartphone-with-bills")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding(.top, 170)
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            
            VStack {
                Spacer()
                HStack {
                    
                    NavigationLink(tag: "AddCardIconView",
                                   selection: $naviSelection,
                                   destination: { AddCardIconView(paymentTitle: paymentTitle, mainSelection: $mainSelection)
                        
                    }) { EmptyView() }
                        .isDetailLink(false)
                    SmallButton(text: "다음") {
                        self.naviSelection = "AddCardIconView"
                    }
                }
                .disabled(paymentTitle.isEmpty ? true : false)
                .padding(.horizontal, 30)
                .padding(.bottom)
            }
            
        }
        .onAppear {
            UIApplication.shared.hideKeyboard()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(role: .cancel) {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .padding(.horizontal)
                }
                .buttonStyle(.plain)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NewPayment_Title_Previews: PreviewProvider {
    static var previews: some View {
        AddCardTitleView(mainSelection: .constant(""))
    }
}
