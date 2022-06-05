//
//  DecorateCardView.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

import SwiftUI
import PhotosUI

struct DecorateCardView: View {
    
//    @StateObject var vm = DecorateCardViewModel()
    
    @State private var decoCase: DecoCase = .account
    
    @State private var account: String = "1002-034-1234" // @@@@
    @State private var color: CardColor = CardColor.blue// @@@@
    @State private var images: [UIImage] = []// @@@@
    @State private var showPhotoPicker = false
    @State var isClicked: Bool = false
    @State private var date = Date()
    
    //    let dismiss: () -> Void
    
    private let colorColumns = [GridItem](repeating: GridItem(spacing: 20), count: 5)
    
    var body: some View {
        
        NavigationView {
            ZStack {
                //                Color(.white)
                //                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    
                    //                    Spacer()
                    //
                    PreviewCardView(account: $account,
                                    color: $color,
                                    date: $date,
                                    image: $images,
                                    decoCase: $decoCase)
                    .padding(.horizontal, 20)
                    //                    PreviewCardView(account: $account,
                    //                                      color: $color,
                    //                                      image: $images,
                    //                    .padding(.horizontal, 20)
                    
                    VStack(spacing: 20) {
                        CustomPicker(selected: $decoCase)
                            .padding(.horizontal, 20)
                        Divider()
                            .frame(height: 1)
                            .padding(.horizontal, 40)
                            .background(Color.grayEE)
//                        Spacer()
                        ZStack {
                            //                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                            //                                .fill(Color.grayEE)
                            if decoCase == .account {
                                accountBox
                            } else if decoCase == .color {
                                colorBox
                                    .padding(.horizontal, 30)
                            } else if decoCase == .date {
                                dateBox
                                    .padding(.horizontal, 30)
                            } else {
                                imageBox
                                    .padding(.horizontal, 40)
                            }
                        }
                        Spacer()
                    }
                    .frame(maxWidth: 380)
                    .frame(maxHeight: 400)
                    .padding(.bottom, 20)
                Spacer()
                }
                VStack{
                    Spacer()
                    SmallButton(
                        text: "완료"
                    ) {
                        print("ChipBtn Clicked!")
                        isClicked.toggle()
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(role: .cancel) {
                        //                        dismiss()
                        print("ㅇㅇㅇ")
                    } label: {
                        Image(systemName: "chevron.backward")
                            .font(.title2.weight(.bold))
                    }
                    .buttonStyle(.plain)
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(role: .cancel) {
                        //                        dismiss()
                        print("ㅇㅇㅇ")
                    } label: {
                        Text("MC2 첫 회식")
                            .font(.title2.weight(.bold))
                    }
                    .buttonStyle(.plain)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    //컬러박스 입력 칸
    private var colorBox: some View {
        LazyVGrid(columns: colorColumns, spacing: 30) {
            ForEach(CardColor.allCases) { CardColor in
                Circle()
                    .fill(CardColor.color)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Circle()
                            .strokeBorder(.white,
                                          lineWidth: color == CardColor ? 4 : 0)
                            .frame(width: 25, height: 25)
                    )
                    .onTapGesture {
                        withAnimation(.interactiveSpring()) {
                            color = CardColor
                        }
                    }
            }
        }
    }
    
    //date picker
    private var dateBox: some View {
        VStack {
            DatePicker("결제한 날짜를 선택해 주세요.", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
            //달력과 텍스트의 위치를 지정하는 프레임
                .frame(width: 350, height: 250)
                .padding(.top, 30.0)
        }
    }
    
    //계좌번호 입력 칸
    private var accountBox: some View {
        TextField("계좌번호를 입력해주세요.", text: $account)
            .font(.title3)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
    }
    //이미지 입력 칸
    private var imageBox: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.grayBC)
                .frame(width: 80, height: 80)
                .overlay(
                    ZStack {
                        Image(systemName: "plus")
                            .font(.largeTitle.weight(.light))
                            .foregroundColor(Color.white)
                        
                        if let image = images.last {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                )
        }
        .contentShape(Rectangle())
        .onTapGesture {
            showPhotoPicker = true
        }
        .sheet(isPresented: $showPhotoPicker) {
            let configuration = PHPickerConfiguration.config
            PhotoPicker(configuration: configuration,
                        images: $images,
                        isPresented: $showPhotoPicker)
        }
    }
}

/* 카드 디자인 변경 케이스 */
enum DecoCase: String, Identifiable, CaseIterable {
    
    case color
    case date
    case account
    case image
    
    var id: String {
        self.rawValue
    }
    
    var name: String {
        self.rawValue
    }
}

struct CustomPicker: View {
    
    @Binding var selected: DecoCase
    
    var body: some View {
        HStack(spacing: 0) {
            
            ForEach(DecoCase.allCases) { decoCase in
                GeometryReader { geo in
                    Text(decoCase.name)
                        .font(.subheadline.bold())
                        .foregroundColor(decoCase == selected ? .white : .gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Capsule())
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selected = decoCase
                            }
                        }
                }
                .frame(height: 40)
            }
        }
        .background(
            GeometryReader { geo in
                Capsule()
                    .fill(Color.blueMain)
                    .frame(width: geo.size.width / 4)
                    .frame(maxWidth: getCapsuleWidth(width: geo.size.width), alignment: .trailing)
            }
                .frame(maxWidth: .infinity)
        )
    }
    
    private func getCapsuleWidth(width: CGFloat) -> CGFloat {
        switch selected {
        case .color:
            return width / 4
        case .date:
            return width / 2
        case .account:
            return width / 4 * 3
        case .image:
            return width
        }
    }
}

struct DecorateCardView_Previews: PreviewProvider {
    static var previews: some View {
        DecorateCardView()
    }
}
