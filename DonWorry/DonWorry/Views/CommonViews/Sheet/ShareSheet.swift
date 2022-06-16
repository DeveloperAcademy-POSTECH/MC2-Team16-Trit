//
//  Reference
//  - https://www.youtube.com/watch?v=WZOvroeUuxI
//  - https://ishtiz.com/swiftui/share-sheet-in-swiftui-using-uiactivityviewcontroller
//  ShareSheet.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/07.
//

import SwiftUI

/** 공유하기 **/
struct ShareSheet: UIViewControllerRepresentable {
    
    // 공유하려는 아이템
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}

/* Share Sheet 사용 방법 */
struct SampleShareSheetView: View {
    
    @State var isSheetPresented = false
    
    var body: some View {
        ZStack {
                
            LargeButton(text: "Large Button", isDisable: false) {
                isSheetPresented.toggle()
            }
            .sheet(isPresented: $isSheetPresented, content: {
                /** iOS 네이티브 공유하기 **/
                ShareSheet(items: ["트라잇에서 정산해요!"])
            })

        }

    }
}
