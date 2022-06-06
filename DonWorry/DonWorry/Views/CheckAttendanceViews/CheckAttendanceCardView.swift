//
//  CheckAttendanceCardView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/04.
//
//
import SwiftUI

struct CheckAttendanceCardView: View {
    let index: Int
    var clicked: () -> Void
    let colors = [Color(hex: "ff5454"), Color.green, Color.purple]
    var body: some View {
        Button {
            print("card view..")
        } label: {
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(colors[index%3])
                    .opacity(0.72)
                    .frame(width: 281, height: 139)
                    .shadow(radius: 5)
                    .overlay {
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("2차 유스택시")
                                    .applyTextWithLineLimitModifier(size: 15, weight: .heavy)
                                    .padding(.leading, 25)
                                    .padding(.top, 24)
                                    .padding(.bottom, 14)
                                HStack(spacing: 8) {
                                    Image("chicken-leg")
                                        .applyRectangleImageModifier(width: 33, height: 33, background: .grayEE, innerPadding: 3, cornerRadius: 8)
                                        .padding(.leading, 21)
                                    Text("총 5,800원")
                                        .applyTextWithLineLimitModifier(size: 20, weight: .heavy)
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                RoundedRectangle(cornerRadius: 20)
                    .fill(colors[index%3])
                    .frame(width: 281, height: 139)
                    .frame(width: 69, alignment: .trailing)
                    .clipped()
                    .overlay(
                        VStack {
                            VStack(spacing: 3) {
                                Image("chicken-leg")
                                    .applyClipCircleModifier(width: 30, height: 30, background: .clear)
                                    .padding(.top, 19)
                                Text("한규")
                                    .applyTextWithLineLimitModifier(size: 13, weight: .medium)
                            }
                            Spacer()
                            Text("05/26")
                                .applyTextWithLineLimitModifier(size: 9, weight: .bold, color: colors[index%3])
                                .applyButtonCustomModifier(backgroundColor: .grayEE.opacity(0.6), width: 40, height: 24, padding: 3, cornerRadius: 15, strokeLineWith: 0)
                                .padding(.bottom, 26)
                        }
                    )
            }
        }
    }
}

struct CheckAttendanceCardView_Previews: PreviewProvider {
    static var previews: some View {
        CheckAttendanceCardView(index: 0, clicked: {})
    }
}
