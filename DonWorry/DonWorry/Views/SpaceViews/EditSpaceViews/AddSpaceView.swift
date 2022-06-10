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
        } else {
            
            VStack(alignment: .leading, spacing: 30) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Group {
                        Text("스페이스를")
                        Text("생성해볼까요?")
                    }
                    .font(.system(size: 30, weight: .bold))
                    
                }
                
                VStack(spacing: 20) {
                    
                    UnderlineTextField(placeholder: "스페이스 이름을 입력하세요", charLimit: 20, text: $spaceName)
                                               
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        SmallButton(text: "완료") {
                            isCompleted = true
                        }
                        .padding(.bottom, 30)
                        .disabled(spaceName.isEmpty ? true : false)
                               
                    }
                    
                }
                
            }
            .navigationBarBackButtonHidden(true)
            .padding(.top, -20)
            .padding(.horizontal, 25)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        self.mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
           
        }
        
    }
}
