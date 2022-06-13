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
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
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
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    NavigationLink(tag: "SpaceMainView",
                                   selection: $pageSelection,
                                   destination: { SpaceMainView(naviSelection: $naviSelection, spaceID: .constant("Hardcoded ID"))
                        
                    }) { EmptyView() }
                        .isDetailLink(false)
                        SmallButton(text: "완료") {
                            self.pageSelection = "SpaceMainView"
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                        .disabled(spaceName.isEmpty ? true : false)
                   
                }
                
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
