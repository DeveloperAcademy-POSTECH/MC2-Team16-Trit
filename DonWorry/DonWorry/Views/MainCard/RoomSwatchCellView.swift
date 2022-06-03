//
//  RoomSwatchCellView.swift
//  DonWorry
//
//  Created by uiskim on 2022/06/03.
//

import SwiftUI

struct RoomSwatchCellView: View {
    
    @Binding var selection: String
    let screen = UIScreen.main.bounds
    
    let swatches = [
        "MC2 번개모임",
        "떱떱해",
        "밤샘코딩",
        "트라잇",
        "문샷"
    ]
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                ForEach(0..<3) { index in
                    Text(swatches[index])
                        .frame(width: 80, height: 12, alignment: .center)
                        .foregroundColor(selection == swatches[index] ? .white : .black)
                        .font(.system(size: 13, weight: .bold))
                        .padding()
                        .background(selection == swatches[index] ? .blue : Color(hex: "EFEFEF"))
                        .cornerRadius(50)
                        .onTapGesture {
                            selection = swatches[index]
                        }
                    }
                }
                HStack {
                    ForEach(3..<5) { index in
                        
                        Text(swatches[index])
                            .frame(width: 80, height: 12, alignment: .center)
                            .foregroundColor(selection == swatches[index] ? .white : .black)
                            .font(.system(size: 13, weight: .bold))
                            .padding()
                            .background(selection == swatches[index] ? .blue : Color(hex: "EFEFEF"))
                            .cornerRadius(50)
                            .onTapGesture {
                                selection = swatches[index]
                            }
                    }
                }
            }
        }
    }
}

struct RoomSwatchCellView_Previews: PreviewProvider {
    static var previews: some View {
        RoomSwatchCellView(selection: .constant("떱떱해"))
    }
}
