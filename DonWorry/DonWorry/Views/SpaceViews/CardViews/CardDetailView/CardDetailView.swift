//
//  CardDetailView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/05.
//
// https://www.patreon.com/posts/early-access-to-48191919
import SwiftUI
import PhotosUI

struct CardDetailView: View {
    
    let admin = true
    @State var isShowingDialog = false
    @State var isShowingAlert = false
    @State private var isPhotoPickerShow = false
    @State private var clickedIndex = 0
    @State private var isEditMode = false
    @State private var cantDeleteAlert = false
//    @State private var isEditPrice = false
//    @State private var isEditAccount = false
    
    @StateObject var imageVM = detailImageViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {

                Group {
                    HStack(spacing: 10) {
                        
                        Spacer()
                        Button {
                            isShowingDialog = true
                        } label: {
                            
                            Image(systemName: "ellipsis")
                                .padding(.top, 40)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    
                    HStack(spacing: 8) {
                        Image("chicken-leg")
                            .applyRectangleImageModifier(width: 37, height: 37, background: Color.grayEE.opacity(0.51))
                        Text("유쓰네 택시")
                            .applyTextWithLineLimitModifier(size: 17, weight: .bold, color: .black)
                    }
                    .padding(.top, 49)
                    HStack(alignment: .firstTextBaseline, spacing: 14) {
                        Text("102,000원")
                            .applyTextWithLineLimitModifier(size: 26, weight: .heavy, color: .black)
                        Text("나왔어요!")
                            .applyTextWithLineLimitModifier(size: 17, weight: .medium, color: .black)
//                        Spacer()
//                        if admin {
//                            Button {
//                                isEditPrice = true
//                            } label: {
//                                Image(systemName: "pencil")
//                                    .font(.system(size: 16, weight: .semibold, design: .default))
//                                    .foregroundColor(.black)
//                            }
//
//                        }
                    }
                    .padding(.top, 14)
                    .padding(.bottom, 19)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color.grayEE)
                
                Group {
                    HStack {
                        
                        HStack {
                            Text("정산자")
                                .applyTextWithLineLimitModifier(size: 17, weight: .bold, color: .black)
                            }.padding(.top, 39)
                        }
                    CardDetailAccountView(isAdmin: admin)
                }
                
                Group {
                    Text("정산 참가자")
                        .applyTextWithLineLimitModifier(size: 17, weight: .bold, color: .black)
                        .padding(.bottom, 25)
                        .padding(.top, 30)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.fixed(30.0))], spacing: 35) {
                            ForEach(0..<4, id: \.self) { _ in
                                VStack(spacing: 13) {
                                    Image("user1")
                                        .applyClipCircleModifier(width: 35, height: 35)
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
                HStack {
                    Text("첨부 사진")
                        .applyTextWithLineLimitModifier(size: 17, weight: .heavy, color: .black)
                    Spacer()
                    if admin {
                        Button {
                            isEditMode.toggle()
                        } label: {
                            Image(systemName: "pencil")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.top, 70)
                .padding(.bottom, 24)
                
                imageBox
            }
            Spacer()
            .confirmationDialog("", isPresented: $isShowingDialog, titleVisibility: .hidden) {

                            Button("카드 삭제") {
                                if admin {
                                    isShowingAlert = true
                                } else {
                                    cantDeleteAlert = true
                                }
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
            .alert("참가자는 삭제할 수 없습니다.", isPresented: $cantDeleteAlert) {
                Button("확인") {}
            } message: {
                Text("")
            }
                
        }
        .padding([.leading, .trailing], 25)
        .sheet(isPresented: $imageVM.showImageViewer, content: {
            CardDetailImageView()
                .environmentObject(imageVM)
        })
        .sheet(isPresented: $isPhotoPickerShow) {
            let configuration = PHPickerConfiguration.config
            PhotoPicker(index: $clickedIndex, configuration: configuration,
                        images: $imageVM.allImages,
                        isPresented: $isPhotoPickerShow)
        }
    }
    
    private var imageBox: some View {
        
            VStack(spacing: 30) {
                HStack {
                    LazyHGrid(rows: [GridItem(.fixed(340.0))], spacing: 20) {
                        ForEach(0..<3) { index in
                            if imageVM.allImages.count >= index {
                                RoundedRectangle(cornerRadius: 10)
                                
                                    .fill(index >= imageVM.allImages.count && isEditMode ? Color.grayBC : Color.clear)
                                .frame(width: 100, height: 100)
                                
                            // 사진 하나 있어도 두개보여준다. 에딧 모드일때만.
                                .overlay(
                                    ZStack(alignment: .topTrailing) {
                                        
                                        if index < imageVM.allImages.count { // 사진이 있으면 보여준다.
                                                
                                                Image(uiImage: imageVM.allImages[index])
                                                    .resizable()
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color.grayBC, lineWidth: 1)
                                                    )
                                            }
                                            if isEditMode { // 수정중일때만 보여준다.
                                                if index < imageVM.allImages.count { // 사진이 있으면 보여준다.
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
                                .onTapGesture {
                                    if isEditMode {
                                        showPhotoPicker(index: index)
                                    } else {
                                        withAnimation(.easeInOut) {
                                            imageVM.selectedImageID = index
                                            imageVM.showImageViewer.toggle()
                                        }
                                    }
                                }
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
        imageVM.allImages.remove(at: index)
    }
    private func showPhotoPicker(index: Int) {
        clickedIndex = index
        isPhotoPickerShow = true
    }
}

// TODO: 모델 들어오면 없어질 ViewModel
class detailImageViewModel: ObservableObject {
    
    @Published var allImages: [UIImage] = [UIImage(named: "user1")!]
    @Published var showImageViewer = false
    @Published var selectedImageID: Int = 0
    @Published var imageViewerOffset: CGSize = .zero

    @Published var imageScale: CGFloat = 1
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeInOut) {
            var translation = value.translation.height
            if translation < 0 {
                translation = -translation
            }
            if translation < 250 {
                imageViewerOffset = .zero
            } else {
                showImageViewer.toggle()
                imageViewerOffset = .zero
            }

        }
    }
}

