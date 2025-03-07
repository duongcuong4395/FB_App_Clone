//
//  MenuCell.swift
//  FaceBookAppClone
//
//  Created by Macbook on 6/3/25.
//

import SwiftUI

struct MenuCell: View {
    private var title: String
    private var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()

            HStack(spacing: 15) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.gray)

                Text(title)

                Spacer()

                Image(systemName: "chevron.down")
            }
            .padding(.horizontal)
            .padding(.vertical, 7)
            .font(.headline)
        }
    }
}
