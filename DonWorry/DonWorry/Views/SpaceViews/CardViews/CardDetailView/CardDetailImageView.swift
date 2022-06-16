//
//  CardDetailImageView.swift
//  DonWorry
//
//  Created by Hankyu Lee on 2022/06/16.
//

import SwiftUI

struct CardDetailImageView: View {
    
    @EnvironmentObject var cardDetailViewModel: detailImageViewModel
    // since onChnage has a problem in Drag Gesture....
    // @GestureState var draggingOffset: CGSize = .zero
    
    var body: some View {
   
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            ScrollView(.init()) {
                TabView(selection: $cardDetailViewModel.selectedImageID) {
                    ForEach(0..<cardDetailViewModel.allImages.count, id: \.self) { index in
                        Image(uiImage: cardDetailViewModel.allImages[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(index)
                            .scaleEffect(cardDetailViewModel.selectedImageID == index ? (cardDetailViewModel.imageScale > 1 ? cardDetailViewModel.imageScale : 1) : 1)
                            .gesture(
                                MagnificationGesture().onChanged({ (value) in
                                    cardDetailViewModel.imageScale = value
                                }).onEnded({ (_) in
                                    withAnimation(.spring()) {
                                        cardDetailViewModel.imageScale = 1
                                    }
                                })
                                
                                .simultaneously(with: DragGesture(minimumDistance: cardDetailViewModel.imageScale == 1 ? 10000 : 0))
                                
                                .simultaneously(with: TapGesture(count: 2).onEnded({
                                    withAnimation {
                                        cardDetailViewModel.imageScale = cardDetailViewModel.imageScale > 1 ? 1 : 4
                                    }
                                }))
                            )
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
        .ignoresSafeArea()
        }
            
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            Button(action: {
                withAnimation(.default) {
                    cardDetailViewModel.showImageViewer.toggle()
                }
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color.white.opacity(0.35))
                    .clipShape(Circle())
                    .padding()
            }).padding(10), alignment: .topLeading
        )
    }
}


struct CardDetailImageView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailImageView()
    }
}
