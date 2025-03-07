//
//  MarketplaceViewModel.swift
//  FaceBookAppClone
//
//  Created by Macbook on 6/3/25.
//

import Foundation

class MarketPlaceViewModel: ObservableObject {
    @Published var items: [Item] = [
        .init(id: UUID().uuidString, item_name: "1 bed 1 bathroom", item_price: 950, imageName: "apartment1"),
        .init(id: UUID().uuidString, item_name: "1 beb 1 bath flat", item_price: 800, imageName: "apartment2"),
        .init(id: UUID().uuidString, item_name: "2015 BMW", item_price: 2600, imageName: "car1"),
        .init(id: UUID().uuidString, item_name: "2028 Mercedes", item_price: 44, imageName: "car2"),
        .init(id: UUID().uuidString, item_name: "corner sofa", item_price: 80, imageName: "sofa1"),
        .init(id: UUID().uuidString, item_name: "corner sofa", item_price: 86, imageName: "sofa2"),
    ]
}
