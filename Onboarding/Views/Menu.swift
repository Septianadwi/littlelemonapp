//
//  Menu.swift
//  Onboarding
//
//  Created by Mac Pro on 13/08/23.
//

import SwiftUI
import CoreData

struct Menu: View {
    @State private var searchText = ""
    @State private var menuItems: [MenuItem] = []
    @State private var selectedCategory: String? = nil
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Dish.entity(), sortDescriptors: []) var dishes: FetchedResults<Dish>
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 250, height: 40)
                        .background(
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 185, height: 40)
                                .clipped()
                        )
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 6, height: 54)
                        .background(
                            Image("profile-image-placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 56, height: 54)
                                .clipped()
                        )
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                        .frame(width: 428, height: 309)
                    
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 139, height: 144)
                        .clipped()
                        .cornerRadius(16)
                        .frame(width: 200, height: 100)
                        .frame(width: 1, alignment: .leading)
                    
                    VStack(spacing: 20) {
                        Text("Little Lemon")
                            .font(
                                Font.custom("Markazi Text", size: 64)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.96, green: 0.81, blue: 0.08))
                            .frame(width: 350, alignment: .leading)
                            .padding(.top)
                        
                        Text("Chicago")
                            .font(Font.custom("Markazi Text", size: 60))
                            .foregroundColor(.white)
                            .frame(height: 30)
                            .frame(width: 350, alignment: .leading)
                        
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(.white)
                            .frame(width: 200, height: 100)
                            .frame(width: 350, alignment: .leading)
                        
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 378, height: 37)
                            .background(Color.white)
                            .cornerRadius(7)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .padding(.leading, 10)
                                    Spacer()
                                    TextField("Search", text: $searchText)
                                        .padding(.horizontal)
                                    
                                }
                            )
                    }
                }
                Text("ORDER FOR DELIVERY!")
                    .font(
                        Font.custom("Karla", size: 20)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                    .frame(width: 350, alignment: .leading)
                
                
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
                
                
                List {
                    ForEach(dishes.filter { dish in
                        let titleMatches = searchText.isEmpty || (dish.title ?? "").localizedStandardContains(searchText)
                        
                        var categoryMatches = true
                        if let selectedCategory = selectedCategory {
                            categoryMatches = dish.category == selectedCategory
                        }
                        
                        return titleMatches && categoryMatches
                    }, id: \.self) { dish in
                        
                        
                        
                        HStack(spacing: 20) { // Adjust the spacing as needed
                            
                            AsyncImage(url: URL(string: dish.image ?? "")) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                } else if phase.error != nil {
                                    Image(systemName: "exclamationmark.icloud.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(.red)
                                        .frame(width: 100, height: 100)
                                } else {
                                    ProgressView()
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(dish.title ?? "")
                                    .font(
                                        Font.custom("Karla", size: 16)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(.black)
                                
                                Text(dish.descriptionDish ?? "")
                                    .font(Font.custom("Karla", size: 12))
                                    .foregroundColor(.black)
                                
                                Text("$\(dish.price ?? "")")
                                    .font(
                                        Font.custom("Karla", size: 16)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .onAppear {
                    getMenuData()
                }
                
            }
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
        
    }
    
    func buildPredicate(_ dish: Dish) -> Bool {
        if searchText.isEmpty {
            return true
        } else {
            return (dish.title ?? "").localizedStandardContains(searchText)
        }
        
    }
    
    func getMenuData() {
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        if let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
    
                        PersistenceController.shared.clear()
                        
                        let decodedResponse = try decoder.decode(MenuList.self, from: data)
                        
                        DispatchQueue.main.async {
                            let viewContext = PersistenceController.shared.container.viewContext
                            
                            
                            for menuItem in decodedResponse.menu {
                                let dish = Dish(context: viewContext)
                                dish.title = menuItem.title
                                dish.image = menuItem.image
                                dish.price = menuItem.price
                                dish.category = menuItem.category
                                dish.descriptionDish = menuItem.descriptionDish
                            }
                            
                            do {
                                try viewContext.save()
                            } catch {
                                print("Error saving to CoreData: \(error)")
                            }
                        }
                    } catch let decodingError {
                        print("Error decoding JSON: \(decodingError)")
                    }
                } else if let error = error {
                    print("Error fetching data: \(error)")
                }
            }
            task.resume()
        }
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
        
    }
}

