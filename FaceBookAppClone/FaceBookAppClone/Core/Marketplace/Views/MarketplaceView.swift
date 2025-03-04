//
//  MarketplaceView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 4/3/25.
//

import SwiftUI

struct MarketPlaceView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                
                let width = proxy.size.width > 0 ? (proxy.size.width / 2) - 3 : 150 // Default 150 nếu width chưa xác định
                  
                ScrollView {
                    HStack {
                        MarketPlaceButton(title: "Sell", imageName: "square.and.pencil", width: proxy.size.width)
                        MarketPlaceButton(title: "Categories", imageName: "list.bullet", width: proxy.size.width)
                        
                    }
                    .padding()
                    Divider()
                    VStack(alignment: .leading) {
                        HStack(spacing: 2) {
                            Text("Today's picks")
                                .font(.headline)
                                .fontWeight(.semibold)

                            Spacer()

                            Image("pin")
                                .resizable()
                                .frame(width: 20, height: 16)

                            Text("London")
                                .font(.subheadline)
                                .foregroundStyle(.blue)
                        }
                        .padding()

                        LazyVGrid(columns: gridItems, spacing: 1) {
                            ForEach(0..<6) { _ in
                                VStack {
                                    Image("apartment1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: width, height: width)
                                        .clipped()

                                    Text("950$ - 1 bed 1 bathroom")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .padding(.vertical)
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("MarketPlace")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: 24) {
                            Image(systemName: "person.fill")
                            Image(systemName: "magnifyingglass")
                        }
                        .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct MarketPlaceButton: View {
    private var title: String
    private var imageName: String
    private var width: CGFloat
    
    init(title: String, imageName: String, width: CGFloat) {
        self.title = title
        self.imageName = imageName
        self.width = width
    }
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
        }
        .frame(width: width * 0.45, height: 44)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}
