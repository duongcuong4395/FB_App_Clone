//
//  MainTabView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 27/2/25.
//

import SwiftUI
import UIKit

struct MainTabView: View {
    @State private var tabSelection: Int = 0

    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                        .environment(\.symbolVariants, tabSelection == 0 ? .fill : .none)
                }
                .onAppear {
                    tabSelection = 0
                }

            Text("Video")
                .tabItem {
                    Image(systemName: "play.tv")
                        .environment(\.symbolVariants, tabSelection == 1 ? .fill : .none)
                }
                .onAppear {
                    tabSelection = 1
                }

            FriendsView()
                .tabItem {
                    Image(systemName: "person.2")
                        .environment(\.symbolVariants, tabSelection == 2 ? .fill : .none)
                }
                .onAppear {
                    tabSelection = 2
                }

            Text("MarketPlace")
                .tabItem {
                    Image(systemName: "cart")
                        .environment(\.symbolVariants, tabSelection == 3 ? .fill : .none)
                }
                .onAppear {
                    tabSelection = 3
                }
            Text("Menu")
                .tabItem {
                    Image(systemName: "text.justify")
                        .environment(\.symbolVariants, tabSelection == 4 ? .fill : .none)
                }
                .onAppear {
                    tabSelection = 4
                }
        }
        .onAppear {
            UITabBar.appearance().barTintColor = .white
        }
    }
}
