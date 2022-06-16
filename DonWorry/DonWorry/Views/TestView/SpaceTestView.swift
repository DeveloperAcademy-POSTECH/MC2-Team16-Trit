////
////  SpaceTestView.swift
////  DonWorry
////
////  Created by YeongJin Jeong on 2022/06/12.
////
//// TODO: 삭제예정 View
//
//import SwiftUI
//
//struct SpaceTestView: View {
//
////    @ObservedObject var fireBaseModel = FireStoreViewModel()
//
//    var body: some View {
//        List(fireBaseModel.spaceList) { item in
//            HStack {
//                VStack {
//                    Text("스페이스 이름: \(item.spaceName)")
//                }
//
//                Button {
//                    fireBaseModel.updateSpace(SpaceToUpdate: item, newSpaceName: "떱떱헤")
//                    fireBaseModel.getSpaceDatas()
//                } label: {
//                    Text("장소바꾸기")
//                }.buttonStyle(BorderedButtonStyle())
//
//                Button {
//                    fireBaseModel.deleteSpaceData(spaceToDelete: item)
//                } label: {
//                    Text("삭제")
//                }.buttonStyle(BorderedButtonStyle())
//
//            }
//        }
//        Spacer()
//        Button {
//            fireBaseModel.addSpaceData(spaceName: "떱떱해")
//        } label: {
//            Text("스페이스 추가하기")
//        }
//
//    }
//
//    init() {
//        fireBaseModel.getSpaceDatas()
//    }
//}
//
//struct SpaceTestView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpaceTestView()
//    }
//}
