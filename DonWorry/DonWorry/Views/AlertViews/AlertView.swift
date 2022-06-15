//
//  AlertView.swift
//  AlertTab
//
//  Created by Chanhee Jeong on 2022/06/05.
//

import SwiftUI

struct AlertView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = false
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                /* DATE-ROW */
                HStack {
                    Text("24일 화요일")
                        .foregroundColor(Color.gray75)
                }.padding(.bottom, 12)
                
                /* ALERT-ROW */
                AlertRow()
                AlertRow(isReminder: true)
                
                GrayLine().padding(.bottom, 12)
                
                /* DATE-ROW */
                HStack {
                    Text("24일 화요일")
                        .foregroundColor(Color.gray75)
                }.padding(.bottom, 12)
                
                /* ALERT-ROW */
                AlertRow()
                AlertRow(isReminder: true)
                
                Spacer()
                
            }
            .padding(.top, -20)
            .padding(.horizontal, 25)
            
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
                Text("알림")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                
            }
        }
        .gesture(DragGesture().updating($dragOffset) { (value, state, transaction) in
                    if (value.startLocation.x < 30 && value.translation.width > 100) {
                        self.mode.wrappedValue.dismiss()
                    }
                })
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
