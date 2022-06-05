//
//  SampleViewWithSheet.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/02.
//

import SwiftUI

struct SampleViewWithSheet: View {
    
    @StateObject var sheetStateModel = SheetStateModel()
    
    var body: some View {
        
        LargeButton(
            text: "Sheet불러오기"
        ) {
            sheetStateModel.showSheet.toggle()
        }
        .halfSheet(showSheet: $sheetStateModel.showSheet) {
            // Sheet내 View의 State 업데이트를 위함
            SheetView()
//                .environmentObject(sheetStateModel)
        } onEnd: {
            print("Sheet Dismissed")
        }
    }
}

struct SheetView: View {
    
    @EnvironmentObject var sheetStateModel: SheetStateModel
    
    var body: some View {
        
        // Your Half Sheet View....
        ZStack {
            
            sheetStateModel.tapped ? Color.blue : Color.orange
            
            VStack {
                
                Text(sheetStateModel.tapped ? "Tap Me Again" : "Tap Me")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .onTapGesture {
                        sheetStateModel.tapped.toggle()
                    }
                
                Button {
                    sheetStateModel.showSheet.toggle()
                } label: {
                    Text("Close From Sheet")
                        .foregroundColor(.white)
                }
                .padding(10)
                
            }
        }
        .ignoresSafeArea()
    }
}

class SheetStateModel: ObservableObject {
    @Published var showSheet = false
    @Published var tapped = false
}

struct SampleViewWithSheet_Previews: PreviewProvider {
    static var previews: some View {
        SampleViewWithSheet()
    }
}
