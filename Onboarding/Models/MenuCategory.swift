//
//  MenuCategory.swift
//  Onboarding
//
//  Created by Mac Pro on 26/08/23.
//

import Foundation

struct CategoryItem: Codable,Identifiable {
    let id = UUID()
    let itemName: String
    let category: String
}

struct MenuData: Codable {
    let menu: [CategoryItem]
}
