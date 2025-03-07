//
//  Post.swift
//  FaceBookAppClone
//
//  Created by Macbook on 6/3/25.
//

import SwiftUI

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let userId: String
    var postTitle: String
    var postLikes: Int
    var postShares: Int
    var postUrl: String
    var isVideo: Bool
    // let timestamp: Timestamp
    var user: User?
}
