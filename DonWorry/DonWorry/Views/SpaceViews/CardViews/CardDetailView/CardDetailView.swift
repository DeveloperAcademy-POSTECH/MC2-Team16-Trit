//
//  CardDetailView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/05.
//
//
import SwiftUI
import PhotosUI

struct CardDetailView: View {
    
    @State var isShowingDialog = false
    @State var isShowingAlert = false
    @State private var images: [UIImage] = [UIImage(named: "user1")!]
    @State private var isPhotoPickerShow = false
    @State private var clickedIndex = 0
    @State private var isEditMode = false
    
    var body: some View {
        
            VStack(alignment: .leading) {
                
                Group {
                    HStack(alignment: .center, spacing: 10) {
                        Image("chicken-leg")
                            .applyRectangleImageModifier(width: 25, height: 25, background: Color.grayEE.opacity(0.51))
                        Text("유쓰네 택시")
                            .applyTextWithLineLimitModifier(size: 20, weight: .heavy, color: .black)
                        Spacer()
                        Button {
                            isShowingDialog = true
                        } label: {
                            Image(systemName: "ellipsis")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 50)
                    Text("총 102,000원")
                        .applyTextWithLineLimitModifier(size: 30, weight: .heavy, color: .black)
                        .padding(.bottom, 6.5)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color.grayEE)
                
                Group {
                    Text("정산자")
                        .applyTextWithLineLimitModifier(size: 17, weight: .bold, color: .black)
                        .padding(.top, 20)
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("우리은행")
                                    .applyTextWithLineLimitModifier(size: 13, weight: .bold, color: .grayAccount)
                                Button {
                                    print("copy!")
                                } label: {
                                    Image(systemName: "doc.on.doc")
                                        .foregroundColor(.grayWithBlue)
                                        .font(Font.system(size: 15, weight: .medium))
                                }
                                .padding(.leading, 5)
                            }
                            .padding(.bottom, 5)
                            HStack {
                                Text("42991010090307")
                                    .applyTextWithLineLimitModifier(size: 13, weight: .regular, color: .grayAccount)
                                Text("(이한규)")
                                    .applyTextWithLineLimitModifier(size: 13, weight: .regular, color: .grayAccount)
                            }
                        }
                        Spacer()
                        VStack(spacing: 4) {
                            Image("chicken-leg")
                                .applyClipCircleModifier(width: 35, height: 35, background: .black, innerPadding: 5)
                            Text("김유쓰")
                                .applyTextWithLineLimitModifier(size: 13, weight: .bold, color: .black)
                        }

                    }
                    .padding(20)
                    .frame(width: 340, height: 90, alignment: .leading)
                    .background(Color.grayF0)
                    .cornerRadius(8)
                    .padding(.top, 10)
                }
                
                Group {
                    Text("정산 참가자")
                        .applyTextWithLineLimitModifier(size: 17, weight: .bold, color: .black)
                        .padding(.top, 36)
                        .padding(.bottom, 10)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.fixed(30.0))], spacing: 35) {
                            ForEach(0..<4, id: \.self) { _ in
                                VStack(spacing: 13) {
                                    Image("chicken-leg")
                                        .applyClipCircleModifier(width: 35, height: 35, background: .yellow)
                                    Text("정루미")
                                        .applyTextWithLineLimitModifier(size: 17, weight: .regular, color: .black)
                                    // ToDo: 이름을 몇글자 까지 보여줄 것인지 정하기
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 80)
                }
            Group {
                Text("첨부 사진")
                    .applyTextWithLineLimitModifier(size: 17, weight: .heavy, color: .black)
                    .padding(.top, 50)
                    .padding(.bottom, 15)
                imageBox
            }
            Spacer()
            .confirmationDialog("", isPresented: $isShowingDialog, titleVisibility: .hidden) {
                            Button("카드 수정") {
                               print("카드 수정")
                                isEditMode = true
                            }
                            Button("카드 삭제") {
                                isShowingAlert = true
                            }
                            Button("Cancel", role: .cancel) {}
                       }
            .alert("스페이스를 삭제하시겠어요?", isPresented: $isShowingAlert, actions: {
                    Button("삭제", action: {
                        
                    })
                Button("취소", role: .cancel, action: {
                    
                }).keyboardShortcut(.defaultAction)
            }, message: {
                Text("삭제하시겠습니까?")
                    .font(.system(size: 13, weight: .regular))
            })
                
        }
        .padding([.leading, .trailing], 25)
        .sheet(isPresented: $isPhotoPickerShow) {
            let configuration = PHPickerConfiguration.config
            PhotoPicker(index: $clickedIndex, configuration: configuration,
                        images: $images,
                        isPresented: $isPhotoPickerShow)
        }
    }
    
    private var imageBox: some View {
        
            VStack(spacing: 30) {
                HStack {
                    LazyHGrid(rows: [GridItem(.fixed(340.0))], spacing: 20) {
                        ForEach(0..<3) { index in
                            if images.count >= index {
                                Button {
                                    showPhotoPicker(index: index)
                                } label: {
                                        RoundedRectangle(cornerRadius: 10)
                                        
                                        .fill(index >= images.count && isEditMode ? Color.grayBC : Color.clear)
                                        .frame(width: 100, height: 100)
                                        
                                        
                                    // 사진 하나 있어도 두개보여준다. 에딧 모드일때만.
                                        .overlay(
                                            ZStack(alignment: .topTrailing) {
                                                    if index < images.count { // 사진이 있으면 보여준다.
                                                        Image(uiImage: images[index])
                                                            .resizable()
                                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                                            
                                                            .overlay(
                                                                RoundedRectangle(cornerRadius: 10)
                                                                    .stroke(Color.grayBC, lineWidth: 1)
                                                            )
                                                            
                                                    }
                                                    if isEditMode { // 수정중일때만 보여준다.
                                                        if index < images.count { // 사진이 있으면 보여준다.
                                                            Button {
                                                                removeImage(index: index)
                                                            } label: {
                                                                Image(systemName: "xmark")
                                                                    .font(.headline)
                                                                    .padding(5)
                                                                    .foregroundColor(.white)
                                                                    .background(Color.black.opacity(0.5))
                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                    .padding(5)
                                                            }
                                                        } else { // 사진없으면
                                                            Image(systemName: "plus")
                                                                .font(.largeTitle.weight(.light))
                                                                .foregroundColor(Color.white)
                                                                
                                                        }
                                                    }
                                                }
                                        )
                                }
                                .disabled(!isEditMode)
                            } else {
                                EmptyView()
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.top, 15.0)
            }
            .frame(width: 340, height: 80)
            .contentShape(Rectangle())
        }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView()
    }
}

extension CardDetailView {
    
    private func removeImage(index: Int) {
        images.remove(at: index)
    }
    private func showPhotoPicker(index: Int) {
        clickedIndex = index
        isPhotoPickerShow = true
    }
}
