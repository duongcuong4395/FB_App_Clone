//
//  MenuView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 5/3/25.
//

import SwiftUI

struct MenuView: View {
    @State private var showLogoutAlert: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                let size = proxy.size
                ScrollView {
                    MenuHeaderView()
                    ShortCutsView(width: size.width)
                    MenuCell(title: "Help & Support", imageName: "questionmark.circle.fill")
                    MenuCell(title: "Settings & privacy", imageName: "gearshape.fill")
                    MenuCell(title: "Also from Meta", imageName: "window.casement.closed")
                    
                    Button(action: {
                        showLogoutAlert.toggle()
                    }, label: {
                        Text("Log Out")
                            .customButtonModifier(width: size.width)
                            .padding()
                    })
                    
                }
                .alert("Logout of your account?", isPresented: $showLogoutAlert, actions: {
                    Button("Logout") {}
                    Button("Cancel", role: .cancel) {}
                })
                .background(Color(.systemGray6))
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Menu")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: 24) {
                            Image(systemName: "gearshape.fill")
                            Image(systemName: "magnifyingglass")
                        }
                        .fontWeight(.bold)
                    }
                }
            }
            
        }
    }
}







