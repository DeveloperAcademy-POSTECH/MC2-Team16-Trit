//
//  AddCardDecoView.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

import SwiftUI
import PhotosUI

/* 카드 디자인 변경 케이스 */
enum DecoCase: String, Identifiable, CaseIterable {
    
    case 색상변경
    case 날짜선택
    case 계좌번호
    case 첨부파일
    
    var id: String {
        self.rawValue
    }
    
    var name: String {
        self.rawValue
    }
}

struct AddCardDecoView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = false
    @Binding var mainSelection: String? // SpaceMainView로 돌아가기 위한 변수입니다.
    
    //  추후 데이터 모델이 생성되면 ViewModel을 통해 데이터를 활용할 예정
    //  @StateObject var vm = AddCardDecoViewModel()
    @State private var decoCase: DecoCase = .색상변경
    @State private var account: String = "1002-034-1234"
    @State private var holder: String = "김예금"
    @State private var color: CardColor = CardColor.blue
    @State private var images: [UIImage] = []
    @State private var showPhotoPicker = false
    @State private var bank: String = "은행 선택"
    @State private var date = Date()
    @State var clickedIndex = 0
    @FocusState private var isFocused: Bool
    private let colorColumns = [GridItem](repeating: GridItem(spacing: 20), count: 5)
    var paymentIcon: Image?
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    PreviewCardView(paymentIcon: paymentIcon, bank: $bank,
                                    account: $account,
                                    color: $color,
                                    date: $date,
                                    image: $images,
                                    decoCase: $decoCase)
                    .padding(.horizontal, 20)
                    VStack(spacing: 20) {
                        CustomPicker(selected: $decoCase)
                            .padding(.horizontal, 20)
                        Divider()
                            .padding(.horizontal, 20)
                            .frame(height: 0)
                            .background(Color.grayEE)
                        switch decoCase {
                        case .색상변경:
                            colorBox
                                .padding(.horizontal, 30)
                        case .날짜선택:
                            dateBox
                                .padding(.horizontal, 30)
                        case .계좌번호:
                            accountBox
                                .padding(.horizontal, 30)
                        case .첨부파일:
                            imageBox
                                .padding(.horizontal, 30)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: 380)
                    .frame(maxHeight: 410)
                    //                    .padding(.bottom, 20)
                    Spacer()
                }
            }
            //                    .padding(.bottom, 20)
            Spacer()
            
            VStack {
                Spacer()
                SmallButton(text: "완료") {
                    mainSelection = nil
                }
                .padding(.bottom)
            }
        }
        .onAppear {
            UIApplication.shared.hideKeyboard()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(role: .cancel) {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .padding(.horizontal)
                }
                .buttonStyle(.plain)
            }
            ToolbarItem(placement: .confirmationAction) {
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
        .gesture(DragGesture().updating($dragOffset) { (value, state, transaction) in
            if (value.startLocation.x < 30 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }
        })
    }
    
    // MARK: 컬러박스 입력 칸
    private var colorBox: some View {
        LazyVGrid(columns: colorColumns, spacing: 30) {
            ForEach(CardColor.allCases) { CardColor in
                Circle()
                    .fill(CardColor.color)
                    .frame(width: 35, height: 35)
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
                .frame(width: 320, height: 200)
                .padding(.top, 40.0)
        }
    }
    
    // MARK: 계좌번호 입력 칸
    @ViewBuilder private var accountBox: some View {
        VStack {
            UnderlineTextField(placeholder: "예금주명을 적어주세요.", charLimit: 10, text: $holder)
                .keyboardType(.default)
            AccountTextField(account: $account, bank: $bank)
                .keyboardType(.decimalPad)
        }
        
        //        TextField("계좌번호를 입력해주세요.", text: $account)
        //            .font(.title3)
        //            .multilineTextAlignment(.center)
        //            .padding(.horizontal, 20)
    }
    
    // MARK: 이미지 입력 칸
    private var imageBox: some View {
        VStack(spacing: 30) {
            HStack {
                LazyHGrid(rows: [GridItem(.fixed(340.0))], spacing: 20) {
                    ForEach(0..<3) { index in
                        if images.count >= index {
                            Button {
                                clickedIndex = index
                                showPhotoPicker = true
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.grayBC)
                                    .frame(width: 100, height: 100)
                                    .overlay(
                                        ZStack(alignment: .topTrailing) {
                                            Image(systemName: "plus")
                                                .font(.largeTitle.weight(.light))
                                                .foregroundColor(Color.white)
                                            
                                            if index < images.count {
                                                Image(uiImage: images[index])
                                                    .resizable()
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                Button {
                                                    print("remove")
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
                                            }
                                        }
                                    )
                                
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.top, 15.0)
        }.frame(width: 340, height: 80)
            .contentShape(Rectangle())
            .sheet(isPresented: $showPhotoPicker) {
                let configuration = PHPickerConfiguration.config
                PhotoPicker(index: $clickedIndex, configuration: configuration,
                            images: $images,
                            isPresented: $showPhotoPicker)
            }
    }
    
}

extension AddCardDecoView {
    private func removeImage(index: Int) {
        print("remove")
        images.remove(at: index)
    }
}

struct CustomPicker: View {
    
    @Binding var selected: DecoCase
    
    var body: some View {
        HStack(spacing: 10) {
            
            ForEach(DecoCase.allCases) { decoCase in
                Text(decoCase.name)
                    .frame(width: 45, height: 12, alignment: .center)
                    .foregroundColor(selected == decoCase ? .white : .gray)
                    .font(.system(size: 13, weight: .bold))
                    .padding()
                    .background(selected == decoCase ? .blue : Color(hex: "EFEFEF"))
                    .cornerRadius(50)
                    .onTapGesture {
                        selected = decoCase
                    }
            }
            
            // 애니매이션 효과있는 커스텀 피커
            //                GeometryReader { _ in
            //                    Text(decoCase.name)
            //                        .font(.subheadline.bold())
            //                        .foregroundColor(decoCase == selected ? .white : .gray)
            //                        .frame(maxWidth: .infinity, maxHeight: .infinity)
            //                        .contentShape(Capsule())
            //                        .onTapGesture {
            //                            withAnimation(.spring()) {
            //                                selected = decoCase
            //                            }
            //                        }
            //                }
            //                .frame(height: 40)
            //            }
        }
        //        .background(
        //            GeometryReader { geo in
        //                Capsule()
        //                    .fill(Color.blueMain)
        //                    .frame(width: geo.size.width / 4)
        //                    .frame(maxWidth: getCapsuleWidth(width: geo.size.width), alignment: .trailing)
        //            }
        //            .frame(maxWidth: .infinity)
        //
        //        )
    }
    
    //    private func getCapsuleWidth(width: CGFloat) -> CGFloat {
    //        switch selected {
    //        case .색상변경:
    //            return width / 4
    //        case .날짜선택:
    //            return width / 2
    //        case .계좌번호:
    //            return width / 4 * 3
    //        case .첨부파일:
    //            return width
    //        }
    //    }
}

struct AddCardDecoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddCardDecoView(mainSelection: .constant(""), paymentIcon: Image("chicken-leg"))
        }
    }
}
