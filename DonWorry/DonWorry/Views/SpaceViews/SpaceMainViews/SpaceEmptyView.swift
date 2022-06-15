//
//  SpaceEmptyView.swift
//  SpaceView
//
//  Created by 김승창 on 2022/06/01.
//

import SwiftUI

struct SpaceEmptyView: View {
    
    let leftPaddingSize: CGFloat = 25.0
    
    @State var isHomeView: Bool = false
    @State var isShowingDialog = false
    @State var isShowingAlert = false
    @State var isModalPresented = false
    @State var isCheckOutAttendanceViewOpened = false
    @State var isEditSpaceNaveViewOpened = false
    @State var isShareSheetPresented = false
    
    // DATA Model 이후
    @State var currentUser = user4
    @State var spaceName = "MC2 첫 회식"
    @Binding var spaceID: String
    @Binding var isPopUpPresented: Bool
    
    var body: some View {
        
        if isHomeView == true {
            HomeView(currentUser: currentUser)
        } else {
            NavigationView {
                ZStack(alignment: .bottom) {
                    VStack {
                        ScrollView {
                            SpaceTopView(mainSelection: .constant(""), spaceID: $spaceID, isIDPopUpPresented: $isPopUpPresented)
                                .padding(.vertical, 21)
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    
                    HStack(spacing: 25) {
                        SpaceMainBottomButton(text: "링크 공유", systemImageString: "square.and.arrow.up", backgroundColor: .blueMain, textColor: .white) {
                            isShareSheetPresented.toggle()
                            print("링크 공유 FUNCTION")
                        }
                        SpaceMainBottomButton(text: "참석 확인", systemImageString: "checkmark", backgroundColor: Color(hex: "#A4C6FF"), textColor: .blueMain) {
                            isCheckOutAttendanceViewOpened = true
                            print("참석 확인 FUNCTION")
                        }
                    }
                    
                    NavigationLink(isActive: $isCheckOutAttendanceViewOpened) {
                        // ToDo: constant 수정
                        CheckAttendanceView(checkedArray: .constant([]))
                    } label: {
                        EmptyView()
                    }
                    NavigationLink(isActive: $isEditSpaceNaveViewOpened) {
                        EditSpaceNameView(spaceName: $spaceName)
                    } label: {
                        EmptyView()
                    }
                }
                
                .sheet(isPresented: $isShareSheetPresented, content: {
                    ShareSheet(items: ["트라잇에서 정산해요!"])
                })
                .sheet(isPresented: $isModalPresented, content: {
                    CardDetailView()
                })
                .confirmationDialog("", isPresented: $isShowingDialog, titleVisibility: .hidden) {
                    
                                Button("스페이스 초기화") {
                                    // Todo: 스페이스 초기화 기능
                                }
                                Button("스페이스 이름 설정") {
                                    isEditSpaceNaveViewOpened = true
                                }
                                Button("스페이스 삭제") {
                                    isShowingAlert = true
                                }
                                Button("Cancel", role: .cancel) {

                                }
                           }
                .alert("스페이스를 삭제하시겠어요?", isPresented: $isShowingAlert, actions: {
                        Button("삭제", action: {
                            
                        })
                    Button("취소", role: .cancel, action: {
                        
                    }).keyboardShortcut(.defaultAction)
                }, message: {
                    Text("지금 삭제하시면 현재까지\n등록된 내용이 삭제됩니다.")
                        .font(.system(size: 13, weight: .regular))
                })
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Text(spaceName)
                            .font(.system(size: 20, weight: .heavy))
                            .padding(.leading, 8)
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        HStack(spacing: 20) {
                            
                            // Edit Space
                            Button {
                                isShowingDialog = true
                            } label: {
                                Image(systemName: "ellipsis")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            
                            // Home
                            Button {
                                isHomeView.toggle()
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                            }.padding(.trailing, 8)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
//    @State private var spaceTitle: String = "MC2 첫 회식"
//    @State private var spaceID: String = "213d42s3s5"
//
//    var body: some View {
//        NavigationView {
//            VStack {
//
//                VStack {
//
//                    HStack {
//                        Text(spaceTitle)
//                            .font(.system(size: 20, weight: .heavy))
//
//                        Spacer()
//
//                        Button {
//                            // Todo : 스페이스 이름 수정
//                        } label: {
//                            Image(systemName: "ellipsis")
//                        }
//
//                        Button {
//                            // Todo : 스페이스 삭제
//                        } label: {
//                            Image(systemName: "xmark")
//                        }
//
//                    }
//                    .foregroundColor(.black)
//
//                    HStack {
//                        // Space ID
//                        HStack(spacing: 8) {
//
//                            Text("Space ID : \(spaceID)")
//                                .foregroundColor(.secondary)
//
//                            // 복사 버튼
//                            Image(systemName: "doc.on.doc")
//
//                        }
//
//                        Spacer()
//
//                        // 정산 추가 버튼
//                        NavigationLink(destination: AddCardTitleView()) {
//                            Text("정산 추가")
//                                .font(.system(size: 15, weight: .bold))
//                                .frame(width: 90, height: 35)
//                                .background(Color.blue
//                                    .opacity(0.14))
//                                .cornerRadius(30)
//                        }
//                    }
//                }
//                .padding(.top, -30)
//
//                Spacer()
//
//                VStack {
//                    Image("debit-card")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 138.75)
//
//                    Text("정산추가 버튼을 눌러 정산내역을 추가 해주세요")
//                        .font(.system(size: 12))
//                        .fontWeight(.medium)
//                        .frame(width: 340, height: 62)
//                        .background(Color(hex: "F2F3F5"))
//                        .cornerRadius(20)
//
//                }
//
//                Spacer()
//
//                HStack {
//                    Button {
//                        // Todo : 링크 공유 기능 추가
//                    } label: {
//                        HStack {
//                            Text("링크 공유")
//                            Image(systemName: "square.and.arrow.up")
//                        }
//                        .foregroundColor(.white)
//                        .frame(width: 162, height: 50)
//                        .background(.blue)
//                        .cornerRadius(25)
//
//                    }
//
//                    Button {
//                        // Todo : 참석 확인 기능 추가
//                    } label: {
//                        HStack {
//                            Text("참석 확인")
//                            Image(systemName: "checkmark")
//                        }
//                        .foregroundColor(.white)
//                        .frame(width: 162, height: 50)
//                        .background(.blue
//                            .opacity(0.4))
//                        .cornerRadius(25)
//
//                    }
//                }
//                .padding(.bottom, 30)
//            }
//            .padding(.horizontal, 25)
//        }
//    }
}

// struct SpaceEmptyView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpaceEmptyView(spaceID: .constant("asdasd"))
//    }
// }
