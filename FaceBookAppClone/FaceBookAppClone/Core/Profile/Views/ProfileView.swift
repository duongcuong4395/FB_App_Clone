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
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack {
                    ProfileHeaderView(width: proxy.size.width)
                    DividerView(width: proxy.size.width)
                    ProfileOptionsView()
                    
                    ProfileFriendsView()
                    DividerView(width: proxy.size.width)
                    
                    ManageProfilePostsView(width: proxy.size.width)
                    ForEach(0 ..< 3) { _ in
                        PostView(facebookBlue: facebookBlue)
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







