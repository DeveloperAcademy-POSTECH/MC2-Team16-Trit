import SwiftUI

struct textCustomModifier: ViewModifier {
    var lineLimit: Int = 1
    var size: CGFloat
    var weight: Font.Weight
    var color: Color
    func body(content: Content) -> some View {
        content
            .lineLimit(lineLimit)
            .font(.system(size: size, weight: weight))
            .foregroundColor(color)
    }
}

struct buttonCustomModifier: ViewModifier {
    var backgroundColor: Color
    var width: CGFloat
    var height: CGFloat
    var padding: CGFloat
    var cornerRadius: CGFloat
    var strokeLineWidth: CGFloat = 1
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height, alignment: .center)
            .padding(.all, padding)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.white, lineWidth: strokeLineWidth)
            )
    }
}
