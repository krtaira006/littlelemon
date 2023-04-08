//
//  MenuList.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/26/23.
//

import Foundation
import CoreData

struct MenuList: Decodable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
