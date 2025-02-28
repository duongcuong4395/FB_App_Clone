//
//  DividerView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 27/2/25.
//

import SwiftUI

struct DividerView: View {
    private var width: CGFloat
    
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        Rectangle()
            .foregroundStyle(Color(.systemGray4))
            .frame(width: width, height: 6)
    }
}
