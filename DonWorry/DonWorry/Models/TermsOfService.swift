//
//  TermsOfService.swift
//  DonWorry
//
//  Created by 김승창 on 2022/06/02.
//

import Foundation

struct Term: Hashable {
    let title: String
    let content: String
    let isEssential: Bool
    var isChecked: Bool
    var showContent: Bool
}




var termsOfService = [
    Term(title: "만 14세 이상입니다.", content: "만 14세 이상입니다. 내용", isEssential: true, isChecked: false, showContent: false),
    Term(title: "돈워리 서비스 이용약관 동의", content: "돈워리 서비스 이용약관 동의 내용", isEssential: true, isChecked: false, showContent: false),
    Term(title: "돈워리 개인정보 수집 및 이용 동의", content: "돈워리 개인정보 수집 및 이용 동의 내용", isEssential: true, isChecked: false, showContent: false),
    Term(title: "돈워리 개인정보 제 3자 제공 동의", content: "돈워리 개인정보 제 3자 제공 동의 내용", isEssential: false, isChecked: false, showContent: false),
    Term(title: "이벤트 알림 수신 동의", content: "이벤트 알림 수신 동의 내용", isEssential: false, isChecked: false, showContent: false)
]
