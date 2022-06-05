//
//  HolderView.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/03.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State private var date = Date()
     
        var body: some View {
            VStack {
                DatePicker("결제한 날짜를 선택해 주세요.", selection: $date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                  // 달력과 텍스트의 위치를 지정하는 프레임
                    .frame(width: 350)
            }
        }
    
struct HolderView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }

struct HolderView_Previews: PreviewProvider {
    static var previews: some View {
        HolderView()
    }
}
