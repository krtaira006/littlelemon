//
//  MenuItem.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/26/23.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    let title: String
    let price: String
    let image: String
    let descriptions: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
        case image = "image"
        case descriptions = "description"
        case category = "category"
    }
}
