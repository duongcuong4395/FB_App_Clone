//
//  Item.swift
//  FaceBookAppClone
//
//  Created by Macbook on 6/3/25.
//

import SwiftUI

struct Item: Identifiable, Hashable, Codable {
    let id: String
    var item_name: String
    var item_price: Int
    var imageName: String
}
