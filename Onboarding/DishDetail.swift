//
//  DishDetail.swift
//  Onboarding
//
//  Created by Mac Pro on 17/08/23.
//

import SwiftUI

struct DishDetail: View {
    let dish: Dish

    var body: some View {
        VStack {
            Text(dish.title ?? "")
                .font(.title)
            Text(dish.price ?? "")
                .font(.headline)
            AsyncImage(url: URL(string: dish.image ?? "")) { phase in
                // ... AsyncImage rendering logic ...
            }
            .frame(width: 200, height: 200) // Set the desired size
            // Add more details as needed...
        }
        .navigationTitle("Detail Menu")
    }
}

struct DishDetail_Previews: PreviewProvider {
    static var previews: some View {
        DishDetail(dish: Dish()) // Pass a sample Dish instance for preview
    }
}

