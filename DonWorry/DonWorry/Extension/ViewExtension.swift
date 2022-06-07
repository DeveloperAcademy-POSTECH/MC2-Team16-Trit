//
//  ViewExtension.swift
//  DonWorry
//
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
    func applyButtonCustomModifier(backgroundColor: Color = Color.blueMain, width: CGFloat = 125.0, height: CGFloat = 25.0, padding: CGFloat = 16, cornerRadius: CGFloat = 25.0, strokeLineWith: CGFloat = 1)-> some View {
        modifier(buttonCustomModifier(backgroundColor: backgroundColor, width: width, height: height, padding: padding, cornerRadius: cornerRadius, strokeLineWidth: strokeLineWith))
    }
}
