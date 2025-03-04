//
//  ProfileHeaderView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 4/3/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    private var width: CGFloat
    
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        VStack {
            Image("cover_picture")
                .resizable()
                .scaledToFill()
                .frame(width: width, height: 250)
            Color.white
                .frame(height: 180)
        }
        .overlay {
            VStack(alignment: .leading) {
                Image("profilePic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(Color(.systemGray6), lineWidth: 3)
                    }
                    .padding(.top, 170)

                Text("Omar Thamri")
                    .font(.title)
                    .fontWeight(.bold)

                Text("4 ")
                    .font(.headline)
                +
                Text("Friends")
                    .font(.headline)
                    .foregroundStyle(.gray)

                HStack {
                    CustomButton(imageName: "plus", title: "Add to story", backgroundColor: .blue, foregroundColor: .white)
                    CustomButton(imageName: "pencil", title: "Edit profile", backgroundColor: Color(.systemGray5), foregroundColor: Color(.darkGray))
                    
                    CustomButton(imageName: "ellipsis", title: "", backgroundColor: Color(.systemGray5), foregroundColor: Color(.darkGray))
                }

                HStack { Spacer() }
            }
            .padding(.horizontal)
        }
    }
}
