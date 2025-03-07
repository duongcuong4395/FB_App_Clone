//
//  StoryFeedView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 27/2/25.
//

import SwiftUI

struct StoryFeedView: View {
    
    @StateObject private var feedVM: FeedViewModel
    
    init(feedVM: FeedViewModel) {
        self._feedVM = StateObject(wrappedValue: feedVM)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                MyStoryCardView(feedVM: feedVM)
                ForEach(0 ..< feedVM.friends.count) { index in
                    StoryCardView(feedVM: feedVM, index: index)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.vertical, 5)
    }
}
