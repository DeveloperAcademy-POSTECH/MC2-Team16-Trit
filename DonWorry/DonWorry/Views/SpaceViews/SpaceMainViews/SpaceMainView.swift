//
//  SpaceMainView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/02.
//
//
import SwiftUI

struct SpaceMainView: View {
    
    let leftPaddingSize: CGFloat = 25.0
    @State var isShowingDialog = false
    @State var isShowingAlert = false
    @State var isModalPresented = false
    @State var isCheckOutAttendanceViewOpened = false
    @State var isEditSpaceNaveViewOpened = false
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack {
                    ScrollView {
                        SpaceTopView(spaceID: "213d42s3s5")
                            .padding(.vertical, 21)
                        LazyVGrid(columns: [GridItem(.fixed(340.0))], spacing: 24) {
                            ForEach(0..<5) { index in
                                if index == 4 {
                                    SpaceMainCalculateStartButton(clicked: {
                                        print("calculate start FUNCTION")
                                    }) .padding(.bottom, 70)
                                } else {
                                    SpaceMainCardView(bank: "하나은행", color: .blueMain, account: "42910090307", index: index, clicked: {
                                        isModalPresented = true
                                        print("MainCard FUNCTION")
                                        
                                    }, isParticipated: false, date: "05/05")
                                }
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                
                HStack(spacing: 25) {
                    SpaceMainBottomButton(text: "링크 공유", systemImageString: "square.and.arrow.up", backgroundColor: .blueMain, textColor: .white) {
                        print("링크 공유 FUNCTION")
                    }
                    SpaceMainBottomButton(text: "참석 확인", systemImageString: "checkmark", backgroundColor: Color(hex: "#A4C6FF"), textColor: .white) {
                        isCheckOutAttendanceViewOpened = true
                        print("참석 확인 FUNCTION")
                    }
                }
                
                NavigationLink(isActive: $isCheckOutAttendanceViewOpened) {
                    CheckAttendanceView()
                } label: {
                    EmptyView()
                }
                NavigationLink(isActive: $isEditSpaceNaveViewOpened) {
                    EditSpaceNameView(spaceName: "MC1")
                } label: {
                    EmptyView()
                }
            }
            .sheet(isPresented: $isModalPresented, content: {
                PaymentDetailView()
            })
            .confirmationDialog("", isPresented: $isShowingDialog, titleVisibility: .hidden) {
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
                    Text("MC2 첫 회식")
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.leading, 8)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    HStack(spacing: leftPaddingSize) {
                        Button {
                            isShowingDialog = true
                            print("ecllipsis FUNCTION")
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                        Button {
                            print("xmark FUNCTION")
                        } label: {
                            Image(systemName: "xmark")
                        }.padding(.trailing, 8)
                    }
                }
            }
        }
    }
}


struct SpaceMainView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceMainView()
        
    }
}
