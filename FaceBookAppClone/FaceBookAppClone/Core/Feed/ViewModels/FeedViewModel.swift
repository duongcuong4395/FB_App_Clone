//
//  FeedViewModel.swift
//  FaceBookAppClone
//
//  Created by Macbook on 6/3/25.
//

import Foundation
import SwiftUI
import PhotosUI


class FeedViewModel: ObservableObject {
    @Published var users: [User] = [
        .init(id: "8", firstName: "Omar", familyName: "Thamri", email: "omar.thamri@gmail.com", profileImageName: "profilePic", coverImageName: "cover picture", age: 28, gender: "male", friendsIds: ["3", "5", "6", "7"], friendsRequestsIds: ["1", "2", "4"], isCurrentUser: true),
        .init(id: "1", firstName: "Dwight", familyName: "Schrute", email: "dwight.schrute@gmail.com", profileImageName: "dwight", age: 50, gender: "male", friendsIds: [], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "2", firstName: "Pam", familyName: "Beesley", email: "pam.beesley@gmail.com", profileImageName: "pam", age: 42, gender: "female", friendsIds: [], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "3", firstName: "Jim", familyName: "Halpert", email: "jim.halpert@gmail.com", profileImageName: "profilePic1", coverImageName: "Story1", age: 40, gender: "male", friendsIds: ["8"], friendsRequestsIds: [], isCurrentUser: false),
        
        .init(id: "4", firstName: "Natasha", familyName: "Romanoff", email: "natasha.romanoff@gmail.com", profileImageName: "romanoff", age: 38, gender: "female", friendsIds: [], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "5", firstName: "Elizabeth", familyName: "Olsen", email: "elizabeth.olsen@gmail.com", profileImageName: "profilePic2", coverImageName: "Story2", age: 32, gender: "female", friendsIds: ["8"], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "6", firstName: "Thomas", familyName: "Shelby", email: "thomas.shelby@gmail.com", profileImageName: "profilePic3", coverImageName: "Story3", age: 43, gender: "male", friendsIds: ["8"], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "7", firstName: "Nancy", familyName: "Wheeler", email: "nancy.wheeler@gmail.com", profileImageName: "profilePick", coverImageName: "Story4", age: 27, gender: "female", friendsIds: ["8"], friendsRequestsIds: [], isCurrentUser: false),
    ]

    @Published var friends: [User] = []

    @Published var posts: [Post] = [
        .init(id: "0", userId: "3", postTitle: "Best team ever", postLikes: 2, postShares: 2, postUrl: "office", isVideo: false),
        .init(id: "1", userId: "8", postTitle: "You'll never walk alone", postLikes: 3, postShares: 4, postUrl: "stadium", isVideo: false)
    ]

    @Published var myPostIndexes: [Int] = []
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { try await loadImage(fromItem: selectedImage) }
        }
    }
    @Published var selectedCoverImage: PhotosPickerItem? {
        didSet {
            Task { try await loadCoverImage(fromItem: selectedCoverImage) }
        }
    }
    @Published var profileImage: Image = Image("no_profile")
    @Published var coverImage: Image = Image("no_profile")
    private var uiImage: UIImage?
    
    init() {
        setupFriends()
        setupPosts()
    }

    private func setupFriends() {
        self.friends = self.users.filter { self.users[0].friendsIds.contains($0.id) }
    }

    private func setupPosts() {
        for index in 0..<posts.count {
            posts[index].user = users.first { $0.id == posts[index].userId }
            
            if posts[index].user == users[0] {
                myPostIndexes.append(index)
            }
        }
    }
    
    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    @MainActor
    func loadCoverImage(fromItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.coverImage = Image(uiImage: uiImage)
    }
}
