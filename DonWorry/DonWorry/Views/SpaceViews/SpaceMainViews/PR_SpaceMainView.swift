//
//  SpaceMainView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/02.
//
//

// MARK: - 발표 용 하드코딩한 페이지입니다.

import SwiftUI

let HardcodedPayments = [
    SpaceMainCardView(bank: "카카오뱅크", spaceName: "왕십리삼겹살", color: Color.blueMain, account: "3333-01-0930532", index: 0, isParticipated: false, date: "06 / 20", paymentIcon: Image("spoon-and-knife"), isDecoView: false, amount: 136000, accountHolder: "Avery", numOfPpl: 5),
    SpaceMainCardView(bank: "우리은행", spaceName: "비룡", color: Color.pink, account: "1002-045-401235", index: 1, isParticipated: false, date: "06 / 20", paymentIcon: Image("spoon-and-knife"), isDecoView: false, amount: 88000, accountHolder: "Asher", numOfPpl: 4),
    SpaceMainCardView(bank: "", spaceName: "순수치킨", color: Color.brown, account: "", index: 2, isParticipated: false, date: "06 / 20", paymentIcon: Image("chicken-leg"), isDecoView: false, amount: 100800, accountHolder: "Isaac", numOfPpl: 5),
    SpaceMainCardView(bank: "", spaceName: "베스킨라빈스", color: Color.green, account: "", index: 3, isParticipated: false, date: "06 / 20", paymentIcon: Image("chocolate-ice-cream"), isDecoView: false, amount: 80000, accountHolder: "Lumi", numOfPpl: 5)
]

struct SpaceMainView: View {
    
    let leftPaddingSize: CGFloat = 25.0
    
    @Binding var naviSelection: String? // HomeView로 돌아가기 위한 변수입니다.
    @State private var mainSelection: String? = nil // SpaceMainView로 돌아오기 위한 변수입니다.
    
    @State var isPopUpPresented = false
    @State var isShowingDialog = false
    @State var isShowingAlert = false
    @State var isModalPresented = false
    @State var isCheckOutAttendanceViewOpened = false
    @State var isEditSpaceNaveViewOpened = false
    @State var isShareSheetPresented = false
    @State var checkedArray: [Int] = []
    @State var spaceName = "MC2 첫 회식"
    @Binding var spaceID: String // AddCardDecoView까지 넘겨서 데이터로 전송해야함.
    
    @State private var isStarted = false // 정산시작이 되었는지 확인하는 변수
    @State private var showExitAlert = false // 스페이스 나가기 시 Alert를 보여주기 위한 변수
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack {
                
                SpaceTopView(naviSelection: $naviSelection, spaceID: $spaceID, isIDPopUpPresented: $isPopUpPresented)
                    .padding(.vertical, 21)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.fixed(340.0))], spacing: 9) {
                        // MARK: 보여주고 싶은 카드의 개수를 범위에 쓰면 됩니다. (최대 4)
                        ForEach(0..<0) { index in
//                            if index == 4 {
//                                NavigationLink(tag: "AddCardTitleView", selection: $mainSelection, destination: {
//                                    AddCardTitleView(mainSelection: $mainSelection, spaceID: spaceID)
//                                }, label: {
//                                    EmptyView()
//                                })
//                                .isDetailLink(false)
//                                AddCardTitleViewButton(clicked: {
//                                    self.mainSelection = "AddCardTitleView"
//                                }) .padding(.bottom, 70)
//                            } else {
//                                SpaceMainCardView(bank: "하나은행", color: .blueMain, account: "4299101009307", index: index, isParticipated: isCheckIndex(index), date: "05/05", paymentIcon: Image("chicken-leg"), isDecoView: false)
//                                    .onTapGesture {
//                                        isModalPresented = true
//                                    }
//                            }
                            
                            HardcodedPayments[index]
                                .onTapGesture {
                                    isModalPresented = true
                                }
                        }
                        NavigationLink(tag: "AddCardTitleView", selection: $mainSelection, destination: { AddCardTitleView(mainSelection: $mainSelection, spaceID: spaceID) }, label: { EmptyView() })
                            .isDetailLink(false)
                        
                        AddCardTitleViewButton {
                            mainSelection = "AddCardTitleView"
                        }
                        .padding(.bottom, 70)
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            
            HStack(spacing: 23) {
                SpaceMainBottomButton(text: "링크 공유", systemImageString: "square.and.arrow.up", backgroundColor: Color.grayBC, textColor: .white) {
                    isShareSheetPresented.toggle()
                    print("링크 공유 FUNCTION")
                }
                SpaceMainBottomButton(text: "참석 확인", systemImageString: "checkmark", backgroundColor: Color.blueMain, textColor: .blueMain) {
                    isCheckOutAttendanceViewOpened = true
                    print("참석 확인 FUNCTION")
                }
            }
            .ignoresSafeArea(.keyboard)
            .padding(.bottom)
            .padding(.horizontal, 30.0)
            
            NavigationLink(isActive: $isCheckOutAttendanceViewOpened) {
                CheckAttendanceView(checkedArray: $checkedArray)
            } label: {
                EmptyView()
            }
            .isDetailLink(false)
            NavigationLink(isActive: $isEditSpaceNaveViewOpened) {
                EditSpaceNameView(spaceName: $spaceName)
            } label: {
                EmptyView()
            }
            .isDetailLink(false)
        }
        
        .sheet(isPresented: $isShareSheetPresented, content: {
            ShareSheet(items: ["트라잇에서 정산해요!"])
        })
        .sheet(isPresented: $isModalPresented, content: {
            CardDetailView()
        })
        .confirmationDialog("", isPresented: $isShowingDialog, titleVisibility: .hidden) {
              
            if !isStarted {
                Button("스페이스 나가기") {
                    showExitAlert = true
                }
            }
            
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
        .alert("스페이스에서 나가시겠어요?", isPresented: $showExitAlert, actions: {
            Button("나가기", action: {
                // TODO: 현재 스페이스에서 현재 유저를 삭제하는 함수 호출
                
                naviSelection = nil
            })
            
            Button("취소", role: .cancel, action: {
                
            }).keyboardShortcut(.defaultAction)
        }, message: {
            Text("스페이스를 나가시면 되돌릴 수 없습니다.")
                .font(.system(size: 13, weight: .regular))
        })
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
                        naviSelection = nil
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
        .popup(isPresented: $isPopUpPresented, type: .floater(verticalPadding: -40), position: .top, animation: .spring(), autohideIn: 1, closeOnTap: true, closeOnTapOutside: true, view: {
            copyTopToastMessage()
        }).zIndex(0)
        
    }
}

struct SpaceMainView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceMainView(naviSelection: .constant(""), spaceID: .constant("asdasd"))
        
    }
}

extension SpaceMainView {
    func isCheckIndex( _ index: Int) -> Bool {
        checkedArray.contains(index) ? true : false
    }
}
