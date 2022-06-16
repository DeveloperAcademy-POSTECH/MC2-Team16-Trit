//
//  CheckAttendanceView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/02.
//
//
import SwiftUI

struct CheckAttendanceView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var originCheckedArray: [Int] = []
    @Binding var checkedArray: [Int]
    let leftPaddingSize: CGFloat = 25
// Todo : cards는 카드로 대체
    let cards = [0, 1, 2, 3]
    private var numberOfCards: Int { cards.count }
    private var numberOfcheck: Int { checkedArray.count }
    
    var body: some View {
            ZStack(alignment: .bottom) {
                VStack {
                    ScrollView {
                        Spacer(minLength: 50)
                        LazyVGrid(columns: [GridItem(.fixed(340))], spacing: 12) {
                            ForEach(cards, id: \.self) { index in
                                HStack {
                                    Button {
                                         checkedArray = filterArray(checkedArray, index: index)
                                    } label: {
                                        ZStack {
                                            Circle()
                                                .frame(width: 42, height: 42, alignment: .leading)
                                            if checkedArray.contains(index) {
                                                ZStack {
                                                    Circle()
                                                        .fill(LinearGradient(colors: [.gradientTopBlue, .gradientBottomBlue], startPoint: .topLeading, endPoint: .bottomTrailing))
                                                        .frame(width: 42, height: 42, alignment: .leading)
                                                    Image(systemName: "checkmark")
                                                        .font(Font.system(size: 16, weight: .bold))
                                                    .foregroundColor(Color.white)
                                                }
                                            }
                                        }.foregroundColor(Color.grayEE)
                                    }
                                    Spacer()
                                    SmallCardView(index: index)
                                }
                                .padding(.bottom, index == 3 ? 70 : 0)
                                // Todo: index는 item개수로 대체 됩니다.
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                
                HStack(spacing: leftPaddingSize) {
                    SpaceMainBottomButton(text: "모두 선택", systemImageString: nil, backgroundColor: .blueMain, textColor: .white) {
                        checkedArray = [Int](0..<numberOfCards)
                        print("링크 공유 FUNCTION")
                    }
                    SpaceMainBottomButton(text: "참석 확인", systemImageString: nil, backgroundColor: Color(hex: "#A4C6FF"), textColor: .blueMain) {
                        mode.wrappedValue.dismiss()
                        print("참석 확인 FUNCTION")
                    }
                }
            }
            .onAppear(perform: {
                originCheckedArray = checkedArray
            })
        .toolbar {
            ToolbarItem(placement: .principal) {
                
                Text("참석확인")
                    .applyTextWithLineLimitModifier(size: 20, weight: .medium, color: .black)
                
            }
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    checkedArray = originCheckedArray
                    mode.wrappedValue.dismiss()
                    print("참석확인")
                } label: {
                    Text("취소")
                        .applyTextWithLineLimitModifier(size: 17, weight: .regular, color: .black)
                }
            }
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                HStack(spacing: 0) {
                    Text("\(numberOfcheck)")
                        .applyTextWithLineLimitModifier(size: 17, weight: .medium, color: .blueMain)
                    Button {
                        checkedArray = []
                        print("선택해제")
                    } label: {
                        Text("선택해제")
                            .applyTextWithLineLimitModifier(size: 17, weight: .regular, color: .black)
                    }
                }
            }
        }
    }
}

struct CheckAttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckAttendanceView(checkedArray: .constant([]))
        }
    }
}

extension CheckAttendanceView {
    // 또 선택하면 사라지고, 아니면 추가 되도록합니다.
    private func filterArray(_ checkedArray: [Int], index: Int) -> [Int] {
        if checkedArray.contains(index) {
            return checkedArray.filter { $0 != index }
        } else {
            return checkedArray + [index]
        }
    }
}
