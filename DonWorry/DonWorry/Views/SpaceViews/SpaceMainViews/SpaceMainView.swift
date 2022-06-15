//
//  SpaceMainView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/02.
//
//
import SwiftUI

struct SpaceMainView: View {
    
    func createTopToastMessage() -> some View {
        Text("복사했습니다!")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width: 110, height: 40)
            .background(Color.grayC5)
            .cornerRadius(20)
    }
    
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
    
    // DATA Model 이후
    @State var currentUser = user4
    @State var spaceName = "MC2 첫 회식"
    @Binding var spaceID: String
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack {
                
                SpaceTopView(mainSelection: $mainSelection, spaceID: $spaceID, isIDPopUpPresented: $isPopUpPresented)
                    .padding(.vertical, 21)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.fixed(340.0))], spacing: 9) {
                        ForEach(0..<5) { index in
                            if index == 4 {
                                NavigationLink(tag: "AddCardTitleView", selection: $mainSelection, destination: { AddCardTitleView(mainSelection: $mainSelection) }) {
                                    EmptyView()
                                }
                                .isDetailLink(false)
                                AddCardTitleViewButton(clicked: {
                                    self.mainSelection = "AddCardTitleView"
                                }) .padding(.bottom, 70)
                            } else {
                                SpaceMainCardView(bank: "하나은행", color: .blueMain, account: "42910090307", index: index, isParticipated: false, date: "05/05", paymentIcon: Image("chicken-leg"))
                                    .onTapGesture {
                                        isModalPresented = true
                                    }
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            
            HStack(spacing: 23) {
                SpaceMainBottomButton(text: "링크 공유", systemImageString: "square.and.arrow.up", backgroundColor: .blueMain, textColor: .white) {
                    isShareSheetPresented.toggle()
                    print("링크 공유 FUNCTION")
                }
                SpaceMainBottomButton(text: "참석 확인", systemImageString: "checkmark", backgroundColor: Color(hex: "#A4C6FF"), textColor: .blueMain) {
                    isCheckOutAttendanceViewOpened = true
                    print("참석 확인 FUNCTION")
                }
            }
            .padding(.bottom)
            .padding(.horizontal, 30.0)
            
            NavigationLink(isActive: $isCheckOutAttendanceViewOpened) {
                CheckAttendanceView()
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
            createTopToastMessage()
        }).zIndex(0)
    }
}

struct SpaceMainView_Previews: PreviewProvider {
    static var previews: some View {
        //        SpaceMainView(spaceID: .constant("Asdasd"))
        SpaceMainView(naviSelection: .constant(""), spaceID: .constant("asdasd"))
        
    }
}
