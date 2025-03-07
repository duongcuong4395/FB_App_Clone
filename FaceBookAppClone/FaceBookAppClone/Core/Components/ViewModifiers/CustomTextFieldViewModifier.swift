//
//  CustomTextFieldViewModifier.swift
//  FaceBookAppClone
//
//  Created by Macbook on 7/3/25.
//

import SwiftUI

struct CustomTextFieldViewModifier: ViewModifier {
    private var width: CGFloat

    init(width: CGFloat) {
        self.width = width
    }

    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.white)
            .frame(width: width - 30, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func customTextFieldViewModifier(width: CGFloat) -> some View {
        modifier(CustomTextFieldViewModifier(width: width))
    }
}
