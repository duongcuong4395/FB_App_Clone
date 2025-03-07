//
//  PostView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 4/3/25.
//

import SwiftUI
import AVKit

struct PostView: View {
    //private var facebookBlue: Color
    private var facebookBlue: Color = Color(red: 26/255, green: 103/255, blue: 178/255)
    
    private var isVideo: Bool
    
    @StateObject private var feedVM: FeedViewModel
    private var index: Int
    
    init(isVideo: Bool, feedVM: FeedViewModel, index: Int) {
        self.isVideo = isVideo
        self._feedVM = StateObject(wrappedValue: feedVM)
        self.index = index
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(feedVM.posts[index].user?.profileImageName ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(feedVM.posts[index].user?.firstName ?? "") \(feedVM.posts[index].user?.familyName ?? "")")
                        .font(.system(size: 14, weight: .semibold))
                    
                    HStack(spacing: 5) {
                        Text("1 d")
                        Circle()
                            .frame(width: 2, height: 2)
                            .fontWeight(.bold)
                        Image(systemName: "globe")
                    }
                    .font(.system(size: 12))
                    .foregroundStyle(facebookBlue)
                }
                
                Spacer()
                
                HStack(spacing: 24) {
                    Image(systemName: "ellipsis")
                    Image(systemName: "xmark")
                }
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.bold)
            }
            .padding(.horizontal)
            
            Text(feedVM.posts[index].postTitle)
                .padding(.horizontal)
            if !isVideo {
                Image(feedVM.posts[index].postUrl)
                    .resizable()
                    .scaledToFill()
            } else {
                if let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: 400)
                }
                
            }
            
            HStack(spacing: 3) {
                Image("like")
                    .resizable()
                    .frame(width: 18, height: 18)

                Text("5")

                Spacer()

                Text("3 comments")

                Text("•")
                    .fontWeight(.bold)

                Text("shares")
            }
            .padding(.horizontal)
            .font(.system(size: 12))
            .foregroundStyle(facebookBlue)
            
            Divider()
                .background(.white.opacity(0.5))
            
            HStack {
                Spacer()

                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }

                Spacer()

                HStack {
                    Image(systemName: "message")
                    Text("Comment")
                }

                Spacer()

                HStack {
                    Image("icone-messager-noir")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Send")
                }

                Spacer()

                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("Share")
                }

                Spacer()
            }
            .font(.system(size: 12))
            .foregroundStyle(facebookBlue)
        }
    }
}
