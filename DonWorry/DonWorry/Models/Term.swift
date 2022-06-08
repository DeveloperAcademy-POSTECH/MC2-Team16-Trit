//
//  TermModel.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/03.
//

import Foundation

// 약관
struct Term: Hashable {
    let title: String // 약관 제목
    let content: String // 약관 상세내용
    let isEssential: Bool // 필수 or 선택
    var isAgreed: Bool = false // 동의 여부
    var showContent: Bool = false // 아코디어 접힘 여부 -  UI 재개발이후 삭제 필요 @Charlie
}

var terms: [Term] = [
    
    Term(title: "만 14세 이상입니다.", content: "만 14세 이상입니다. 내용", isEssential: true, isAgreed: false),
    Term(title: "돈워리 서비스 이용약관 동의", content: "돈워리 서비스 이용약관 동의 내용", isEssential: true, isAgreed: false),
    Term(title: "돈워리 개인정보 수집 및 이용 동의", content: "돈워리 개인정보 수집 및 이용 동의 내용", isEssential: true, isAgreed: false),
    Term(title: "돈워리 개인정보 제 3자 제공 동의", content: "돈워리 개인정보 제 3자 제공 동의 내용", isEssential: false, isAgreed: false),
    Term(title: "이벤트 알림 수신 동의", content: "이벤트 알림 수신 동의 내용", isEssential: false, isAgreed: false)
    
]
