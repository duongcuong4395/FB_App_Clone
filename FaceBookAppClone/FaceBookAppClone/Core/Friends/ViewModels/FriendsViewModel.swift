//
//  FriendsViewModel.swift
//  FaceBookAppClone
//
//  Created by Macbook on 6/3/25.
//

import Foundation

class FriendsViewModel: ObservableObject {
    @Published var users: [User] = [
        .init(id: "8", firstName: "Omar", familyName: "Thamri", email: "omar.thamri@gmail.com", profileImageName: "profilePic", age: 28, gender: "male", friendsIds: ["3"]
              , friendsRequestsIds: ["1", "2", "4"], isCurrentUser: true),
        .init(id: "1"
              , firstName: "Dwight", familyName: "Schrute"
              , email: "dwight.schrute@gmail.com"
              , profileImageName: "dwight"
              , age: 50, gender: "male", friendsIds: [], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "2", firstName: "Pam", familyName: "Beesley"
              , email: "pam.beesley@gmail.com"
              , profileImageName: "pam"
              , age: 42, gender: "female", friendsIds: [], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "3", firstName: "Jim", familyName: "Halpert", email: "jim.halpert@gmail.com", profileImageName: "profilePic", age: 48, gender: "male", friendsIds: ["8"], friendsRequestsIds: [], isCurrentUser: false),
        .init(id: "4", firstName: "Natasha", familyName: "Romanoff"
              , email: "natasha.romanoff@gmail.com"
              , profileImageName: "romanoff"
              , age: 38, gender: "female", friendsIds: [], friendsRequestsIds: [], isCurrentUser: false),
    ]

    @Published var friendsRequests: [User] = []

    init() {
        setupFriendsRequests()
    }

    private func setupFriendsRequests() {
        self.friendsRequests = self.users.filter { self.users[0].friendsRequestsIds.contains($0.id) }
    }
}
