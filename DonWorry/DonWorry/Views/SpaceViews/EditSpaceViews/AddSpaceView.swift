//
//  AddSpaceView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/08.
//

import SwiftUI

struct AddSpaceView: View {
    
    @State var spaceName: String = ""
    @State var isCompleted: Bool = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        if isCompleted == true {
            SpaceMainView(spaceID: $spaceName)
        }
        else {
            
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading) {
                        Text("정산 내역을")
                        Text("추가해볼까요?")
                }
                .font(.system(size: 25, weight: .bold))
                .padding(.horizontal, 30)
                .padding(.vertical)
                
                VStack(spacing: 20) {
                    
                    UnderlineTextField(placeholder: "스페이스 이름을 입력하세요", charLimit: 20, text: $spaceName)
                                               
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        SmallButton(text: "완료") {
                            isCompleted = true
                        }
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
}
