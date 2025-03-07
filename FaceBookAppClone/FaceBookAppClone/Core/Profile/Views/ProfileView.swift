//
//  ProfileView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 27/2/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    private var facebookBlue: Color = Color(red: 26/255, green: 103/255, blue: 178/255)
    
    @StateObject private var feedVM: FeedViewModel
    
    init(feedVM: FeedViewModel) {
        self._feedVM = StateObject(wrappedValue: feedVM)
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack {
                    ProfileHeaderView(width: proxy.size.width, feedVM: feedVM)
                    DividerView(width: proxy.size.width)
                    ProfileOptionsView()
                    
                    ProfileFriendsView(feedVM: feedVM)
                    DividerView(width: proxy.size.width)
                    
                    ManageProfilePostsView(width: proxy.size.width)
                    
                    ForEach(0 ..< feedVM.myPostIndexes.count) { index in
                        PostView(isVideo: false, feedVM: feedVM, index: feedVM.myPostIndexes[index])
                    }
                    
                }
                
                .scrollIndicators(.hidden)
                .navigationTitle("Omar Thamri")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            // Hành động khi nhấn nút tìm kiếm
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
    }
}







