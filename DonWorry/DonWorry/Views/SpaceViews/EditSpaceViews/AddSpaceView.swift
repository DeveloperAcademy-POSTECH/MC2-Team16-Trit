//
//  AddSpaceView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import SwiftUI

struct AddSpaceView: View {
    @Binding var naviSelection: String?
    @State var spaceName: String = ""
    @State private var pageSelection: String? = nil // 다음 페이지로 이동을 위한 일회성의 변수입니다.
    @FocusState private var isFocused: Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var isDisable: Bool {
        spaceName.isEmpty
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment: .leading) {
                Text("스페이스를")
                Text("생성해볼까요?")
            }
            .font(.system(size: 25, weight: .bold))
            .padding(.horizontal, 30)
            .padding(.vertical)
            
            VStack(spacing: 20) {
                
                UnderlineTextField(placeholder: "스페이스 이름을 입력하세요", charLimit: 20, text: $spaceName)
                    .keyboardType(.default)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    NavigationLink(tag: "SpaceMainView",
                                   selection: $pageSelection,
                                   destination: { SpaceMainView(naviSelection: $naviSelection, spaceID: .constant("123mdk3id2kcjsnj3394jfucr"))
                        
                    }) { EmptyView() }
                        .isDetailLink(false)
                        SmallButton(text: "완료", isDisable: isDisable) {
                            self.pageSelection = "SpaceMainView"
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                        .disabled(isDisable ? true : false)
                   
                }
                
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
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                .buttonStyle(.plain)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
