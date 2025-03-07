//
//  FriendsView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 4/3/25.
//

import SwiftUI

struct FriendsView: View {
    @StateObject private var friendsVM = FriendsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    HStack {
                        TagView(title: "suggestions")
                        TagView(title: "your friends")
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    Divider()

                    HStack {
                        Text("Friends requests")
                            .font(.headline)
                            .fontWeight(.semibold)

                        Text("\(friendsVM.friendsRequests.count)")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)

                        Spacer()

                        Button(action: {}, label: {
                            Text("See All")
                        })
                    }
                    .padding(.horizontal)

                    ForEach(0 ..< friendsVM.friendsRequests.count) { index in
                        FriendCell(friendsVM: friendsVM, index: index)
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(.vertical)
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Friends")
                        .font(.title)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .fontWeight(.bold)
                }
            }
        }
    }
}


