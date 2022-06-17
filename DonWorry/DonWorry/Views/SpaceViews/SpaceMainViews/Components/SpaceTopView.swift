//
//  SwiftUIView.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/01.
//
//
import SwiftUI

struct SpaceTopView: View {
//    @StateObject var vm = PaymentViewModel()
    
    let leftPaddingSize = 25.0
    @Binding var naviSelection: String? // HomeView로 돌아가기 위한 변수입니다.
    @Binding var spaceID: String
    @Binding var isIDPopUpPresented: Bool
    
    var body: some View {
        HStack {
            Text("Space ID : \(spaceID)")
                .applyTextWithLineLimitModifier(size: 14, weight: .regular, color: .black)
                .opacity(0.5)
                .padding(.leading, leftPaddingSize)
            Button {
                isIDPopUpPresented.toggle()
                copyToPasteboard(spaceID)
            } label: {
//                Text("복사하기")
                Image(systemName: "doc.on.doc")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .opacity(0.5)
//                    .applyTextWithLineLimitModifier(size: 9, weight: .bold, color: .white)
//                    .applyButtonCustomModifier(backgroundColor: .grayC5, width: 47, height: 19, padding: 3)
            }
            Spacer()
            
//            NavigationLink(tag: "CalculateStartView", selection: $naviSelection, destination: { HomeView() }) { EmptyView() }
//            .isDetailLink(false)
            Button {
                // TODO: 알고리즘 적용 후 Lottie 화면 출력하기
                /*
                 --- 알고리즘 Input ---
                 스페이스 내에 있는 payment의 개수
                 
                 payment amount
                 payment givers
                 payment taker
                 --------------------
                 */
                
                 /*
                 --- 알고리즘 Output ---
                 transfer giver
                 transfer taker
                 transfer amount
                 ---------------------
                 
                 
                 */
                naviSelection = nil
            } label: {
                Text("정산시작")
                    .applyTextWithLineLimitModifier(size: 16.0, weight: .bold, color: .blueMain)
                    .applyButtonCustomModifier(backgroundColor: .paleBlue, width: 92, height: 26, padding: 4, cornerRadius: 16, strokeLineWith: 0)
                    .padding(.trailing, leftPaddingSize)
            }
        }
    }
}

//struct SpaceTopView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpaceTopView(mainSelection: .constant(""), spaceID: .constant("asdvasdvasdvas"))
//    }
//}
