//
//  NewPayment_Title.swift
//  SpaceView
//
//  Created by 김승창 on 2022/06/01.
//

import SwiftUI

struct AddCardTitleView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var paymentTitle: String = ""
    @State private var naviSelection: String? = nil
    
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
                    
                    Image("smartphone-with-bills")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .padding(.top, 30)
                                               
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
            VStack {
                Spacer()
                NavigationLink(destination: AddCardIconView(paymentTitle: paymentTitle),
                               tag: "add",
                               selection: $naviSelection) {EmptyView()}
                HStack {
                    Spacer()
                    SmallButton(text: "다음") {
                        self.naviSelection = "add"
                    }
                }
                .padding(.horizontal, 30)
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
        AddCardTitleView()
    }
}
