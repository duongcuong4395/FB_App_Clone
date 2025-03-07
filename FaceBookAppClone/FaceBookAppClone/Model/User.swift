//
//  User.swift
//  FaceBookAppClone
//
//  Created by Macbook on 6/3/25.
//

import SwiftUI

struct User: Identifiable, Hashable, Codable {
    let id: String
    var firstName: String
    var familyName: String
    var email: String
    var profileImageName: String?
    var coverImageName: String?
    var age: Int
    let gender: String
    var friendsIds: [String]
    var friendsRequestsIds: [String]
    var isCurrentUser: Bool
}
