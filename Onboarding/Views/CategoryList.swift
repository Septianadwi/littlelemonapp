//
//  CategoryList.swift
//  Onboarding
//
//  Created by Mac Pro on 26/08/23.
//

import SwiftUI

struct CategoryList: View {
    @State private var selectedCategory: String? = nil
    
    let categoryItems: [CategoryItem] = [
        CategoryItem(itemName: "Item 1", category: "starters"),
        CategoryItem(itemName: "Item 2", category: "mains"),
        CategoryItem(itemName: "Item 3", category: "desserts"),
        CategoryItem(itemName: "Item 4", category: "sides"),
        // ... Daftar menuItems lainnya
    ]
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Button(action: {
                    selectedCategory = "starters"
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
                            .frame(width: 80, height: 34)
                            .cornerRadius(7)
                        
                        Text("Starters")
                            .font(
                                Font.custom("Karla", size: 16)
                                    .weight(.bold)
                            )
                            .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                    }
                }
                
                Button(action: {
                    selectedCategory = "mains"
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
                            .frame(width: 80, height: 34)
                            .cornerRadius(7)
                        
                        Text("Mains")
                            .font(
                                Font.custom("Karla", size: 16)
                                    .weight(.bold)
                            )
                            .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                    }
                }
                
                Button(action: {
                    selectedCategory = "desserts"
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
                            .frame(width: 80, height: 34)
                            .cornerRadius(7)
                        
                        Text("Desserts")
                            .font(
                                Font.custom("Karla", size: 16)
                                    .weight(.bold)
                            )
                            .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                    }
                }
                
                Button(action: {
                    selectedCategory = "sides"
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
                            .frame(width: 80, height: 34)
                            .cornerRadius(7)
                        
                        Text("Sides")
                            .font(
                                Font.custom("Karla", size: 16)
                                    .weight(.bold)
                            )
                            .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                    }
                }
            }
            
            List(categoryItems.filter { menuItem in
                if let selectedCategory = selectedCategory {
                    return menuItem.category == selectedCategory
                }
                return true
            }) { menuItem in
                Text(menuItem.itemName)
            }
        }
    }
}
struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
