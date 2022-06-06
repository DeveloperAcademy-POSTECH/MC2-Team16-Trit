//
//  DecorateCardView.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

import SwiftUI
import PhotosUI

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

struct DecorateCardView: View {
    
    //  추후 데이터 모델이 생성되면 ViewModel을 통해 데이터를 활용할 예정
    //  @StateObject var vm = DecorateCardViewModel()
    @State private var decoCase: DecoCase = .account
    @State private var account: String = "1002-034-1234"
    @State private var color: CardColor = CardColor.blue
    @State private var images: [UIImage] = []
    @State private var showPhotoPicker = false
    @State private var isClicked: Bool = false
    @State private var date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM / dd"
        return formatter
    }
    
    private let colorColumns = [GridItem](repeating: GridItem(spacing: 20), count: 5)
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    PreviewCardView(account: $account,
                                    color: $color,
                                    date: dateFormatter.string(from: date),
                                    image: $images,
                                    decoCase: $decoCase)
                    .padding(.horizontal, 20)
                    
                    VStack(spacing: 20) {
                        CustomPicker(selected: $decoCase)
                            .padding(.horizontal, 20)
                        Divider()
                            .frame(height: 1)
                            .padding(.horizontal, 40)
                            .background(Color.grayEE)
                        ZStack {
                            switch decoCase {
                            case .color:
                                colorBox
                                    .padding(.horizontal, 30)
                            case .date:
                                dateBox
                                    .padding(.horizontal, 30)
                            case .account:
                                accountBox
                            case .image:
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
                VStack {
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
                        print("이전 페이지 뷰 연결")
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
                        print("클릭 시 스페이스 메인으로 가게 하려고 함")
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
    
    // MARK: 컬러박스 입력 칸
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
    
    // MARK: date picker
    private var dateBox: some View {
        VStack {
            DatePicker("결제한 날짜를 선택해 주세요.", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
            // 달력과 텍스트의 위치를 지정하는 프레임
                .frame(width: 350, height: 250)
                .padding(.top, 30.0)
        }
    }
    
    // MARK: 계좌번호 입력 칸
    private var accountBox: some View {
        TextField("계좌번호를 입력해주세요.", text: $account)
            .font(.title3)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
    }
    
    // MARK: 이미지 입력 칸
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

struct CustomPicker: View {
    
    @Binding var selected: DecoCase
    
    var body: some View {
        HStack(spacing: 0) {
            
            ForEach(DecoCase.allCases) { decoCase in
                GeometryReader { _ in
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
