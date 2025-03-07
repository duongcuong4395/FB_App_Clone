//
//  HeaderView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 27/2/25.
//

import SwiftUI

struct HeaderView: View {
    @State private var showCreatePost: Bool = false
    @StateObject private var feedVM: FeedViewModel
    
    init(feedVM: FeedViewModel) {
        self._feedVM = StateObject(wrappedValue: feedVM)
    }
    
    var body: some View {
        HStack {
            NavigationLink {
                ProfileView(feedVM: feedVM)
                    .navigationBarBackButtonHidden()
            } label: {
                Image(feedVM.users[0].profileImageName ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
            Button(action: {
                showCreatePost.toggle()
            }, label: {
                HStack {
                    Text("What's on your mind?")
                        .foregroundStyle(.black)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .overlay {
                    Capsule()
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding(.leading, 5)
                .padding(.trailing, 15)
            })
            

            

            Image(systemName: "photo.on.rectangle.angled")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
                .foregroundStyle(.green)
        }
        .padding(.horizontal)
        .padding(.top, 30)
        .padding(.bottom)
        .fullScreenCover(isPresented: $showCreatePost) {
            CreatePostView()
        }
    }
}
