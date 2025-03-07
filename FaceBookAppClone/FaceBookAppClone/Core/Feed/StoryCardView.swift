//
//  StoryCardView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 27/2/25.
//

import SwiftUI

struct StoryCardView: View {
    
    @StateObject private var feedVM: FeedViewModel
    private var index: Int
    
    init(feedVM: FeedViewModel, index: Int) {
        self._feedVM = StateObject(wrappedValue: feedVM)
        self.index = index
    }
    
    var body: some View {
        Image(feedVM.friends[index].coverImageName ?? "")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 170)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay {
                VStack(alignment: .leading) {
                    Image(feedVM.friends[index].profileImageName ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.blue, lineWidth: 3)
                        }

                    Spacer()

                    Text("\(feedVM.friends[index].firstName) \(feedVM.friends[index].familyName)")
                        .foregroundStyle(.white)
                        .font(.system(size: 12, weight: .semibold))

                    HStack {
                        Spacer()
                    }
                }
                .padding(.leading, 8)
                .padding(.vertical, 8)
            }
    }
}
