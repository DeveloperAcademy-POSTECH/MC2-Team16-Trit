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
    @State var value:CGFloat = 0
    
    let maxLength = 15
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("정산 내역을")
                    Text("추가해볼까요?")
                }
                .font(.system(size: 25, weight: .bold))
                .padding(.vertical)
                
                VStack(spacing: 20) {
                    
                    UnderlineTextField(placeholder: "정산하고자 하는 항목을 입력하세요", charLimit: 20, text: $paymentTitle)
                    
                    Spacer()
                    
                    // 수정 전
                    //                        NavigationLink(destination: AddCardIconView(paymentTitle: paymentTitle)) {
                    //                            HStack{
                    //                                Text("다음")
                    //                                    .frame(width: 135, height: 50)
                    //                                    .foregroundColor(.white)
                    //                                    .background(paymentTitle.isEmpty ? .blue.opacity(0.3) : .blue)
                    //                                    .cornerRadius(29)
                    //                            }
                    //                        }
                    //                        .padding([.leading, .bottom, .trailing], 30)
                    //                        .disabled(paymentTitle.isEmpty ? true : false)
                }
            }
            VStack{
                Spacer()
                Image("smartphone-with-bills")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding(.top, 30)
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
                .padding(.horizontal, 30)
                .padding(.bottom)
            }
            
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
