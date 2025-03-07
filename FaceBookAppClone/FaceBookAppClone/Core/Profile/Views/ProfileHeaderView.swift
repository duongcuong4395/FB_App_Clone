//
//  ProfileHeaderView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 4/3/25.
//

import SwiftUI
import PhotosUI

struct ProfileHeaderView: View {
    private var width: CGFloat
    
    @StateObject private var feedVM: FeedViewModel
    @State private var showProfileImageImagePicker: Bool = false
    @State private var showCoverImageImagePicker: Bool = false
    
    
    init(width: CGFloat, feedVM: FeedViewModel) {
        self.width = width
        
        self._feedVM = StateObject(wrappedValue: feedVM)
    }
    
    var body: some View {
        VStack {
            Button(action: {
                showCoverImageImagePicker.toggle()
            }, label: {
                //Image(feedVM.users[0].coverImageName ?? "")
                feedVM.coverImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: 250)
            })
            
            Color.white
                .frame(height: 180)
        }
        .overlay {
            VStack(alignment: .leading) {
                
                Button(action: {
                    showProfileImageImagePicker.toggle()
                }, label: {
                    //Image(feedVM.users[0].profileImageName ?? "")
                    feedVM.profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(Color(.systemGray6), lineWidth: 3)
                        }
                        .padding(.top, 170)
                })
                

                Text("\(feedVM.users[0].firstName) \(feedVM.users[0].familyName)")
                    .font(.title)
                    .fontWeight(.bold)

                Text("\(feedVM.friends.count) ")
                    .font(.headline)
                +
                Text("Friends")
                    .font(.headline)
                    .foregroundStyle(.gray)

                HStack {
                    CustomButton(imageName: "plus", title: "Add to story", backgroundColor: .blue, foregroundColor: .white)
                    CustomButton(imageName: "pencil", title: "Edit profile", backgroundColor: Color(.systemGray5), foregroundColor: Color(.darkGray))
                    
                    CustomButton(imageName: "ellipsis", title: "", backgroundColor: Color(.systemGray5), foregroundColor: Color(.darkGray))
                }

                HStack { Spacer() }
            }
            .padding(.horizontal)
        }
        .photosPicker(isPresented: $showProfileImageImagePicker, selection: $feedVM.selectedImage)
        .photosPicker(isPresented: $showCoverImageImagePicker, selection: $feedVM.selectedCoverImage)
    }
}
