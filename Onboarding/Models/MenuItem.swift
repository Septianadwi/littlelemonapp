//
//  MenuItem.swift
//  Onboarding
//
//  Created by Mac Pro on 14/08/23.
//

import Foundation

struct MenuItem: Decodable {
    var id = UUID()
    let title: String
    let image: String
    let price: String
    let descriptionDish: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case descriptionDish = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}



