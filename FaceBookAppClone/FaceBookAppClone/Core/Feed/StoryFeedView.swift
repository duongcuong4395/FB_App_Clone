//
//  StoryFeedView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 27/2/25.
//

import SwiftUI

struct StoryFeedView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                MyStoryCardView()
                ForEach(0 ..< 3) { _ in
                    StoryCardView()
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.vertical, 5)
    }
}
