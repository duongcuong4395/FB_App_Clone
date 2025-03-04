//
//  CreatePost.swift
//  FaceBookAppClone
//
//  Created by Macbook on 4/3/25.
//

import SwiftUI

struct CreatePostView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var mindText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Divider()

                HStack(alignment: .top) {
                    Image("profilePic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text("Omar Thamri")
                        HStack {
                            ChoiceView(imageName: "person.2.fill", title: "Friends")
                            ChoiceView(imageName: "", title: "Album")
                        }
                        ChoiceView(imageName: "camera", title: "Off")
                        
                        
                    }
                    .padding(.horizontal)
                }
                .padding()
                
                TextField("What's on your mind?", text: $mindText, axis: .vertical)
                    .padding(.horizontal)
                Spacer()
                
                Divider()
                HStack {
                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "photo.fill.on.rectangle.fill")
                            .foregroundStyle(.green)
                    })

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "person.fill")
                            .foregroundStyle(.blue)
                    })

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "face.smiling")
                            .foregroundStyle(.yellow)
                    })

                    Spacer()

                    Button(action: {}, label: {
                        Image("pin")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.red)
                    })

                    Spacer()

                    Button(action: {}, label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .foregroundStyle(.green)
                    })

                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        })
                        Text("Create Post")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 80, height: 35)
                            .foregroundStyle(mindText.count == 0 ? Color(.darkGray) : .white)
                            .background(mindText.count == 0 ? Color(.systemGray5) : .blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .disabled(mindText.count == 0)
                }
            }
        }
    }
}


struct ChoiceView: View {
    private var imageName: String
    private var title: String
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Image(systemName: imageName)
                    .frame(width: 14, height: 12)

                Text(title)

                Text(" ")
                    .font(.caption2)
            }
            .foregroundStyle(.blue)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
