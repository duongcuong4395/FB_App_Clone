//
//  ProfileFriendsView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 4/3/25.
//

import SwiftUI

struct ProfileFriendsView: View {
    private var gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Friends")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("4 friends")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Text("Find Friends")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            }

            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach(0..<4) { _ in
                    VStack {
                        Image("profilePic1")
                            .resizable()
                            .scaledToFill()
                            //.frame(width: (proxy.size.width / 3) - 50, height: (proxy.size.width / 3) - 40)
                            
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("Jim Halpert")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                }
            }

            Text("See all friends")
                .font(.headline)
                .fontWeight(.semibold)
                //.frame(width: proxy.size.width - 10.0, height: 44)
                .padding(.vertical,10)
                .padding([.leading, .trailing], 50)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.vertical)
                .foregroundStyle(Color(.darkGray))
        }
        .padding(.horizontal, 5)
    }
}
