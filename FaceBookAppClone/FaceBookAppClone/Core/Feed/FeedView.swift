//
//  FeedView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 27/2/25.
//

import SwiftUI

struct FeedView: View {
    private var facebookBlue: Color = Color(red: 26/255, green: 103/255, blue: 178/255)
    @StateObject private var feedVM = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView(showsIndicators: false) {
                    VStack {
                        HeaderView(feedVM: feedVM)
                        DividerView(width: proxy.size.width)
                        StoryFeedView(feedVM: feedVM)
                        DividerView(width: proxy.size.width)
                        
                        ForEach(0 ..< feedVM.posts.count) { index in
                            PostView(isVideo: false, feedVM: feedVM, index: index)
                            DividerView(width: proxy.size.width)
                        }
                        
                        Spacer()
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text("Facebook")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundStyle(facebookBlue)
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack(spacing: 24) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)

                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)
                                    .font(.system(size: 18, weight: .bold))

                                Image(systemName: "ellipsis.message.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }
                }
                
                
            }
            
            
        }
    }
}










