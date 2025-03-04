//
//  ReelReusableView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 4/3/25.
//

import SwiftUI

struct ReelReusableView: View {
    private var title: String
    private var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 16, height: 16)
                .foregroundStyle(.red)

            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.darkGray))
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 8)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
