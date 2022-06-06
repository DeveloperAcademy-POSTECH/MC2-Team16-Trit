//
//  ViewExtension.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/06/06.
//

import Foundation
import SwiftUI

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    func getRootViewController() -> UIViewController {
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
