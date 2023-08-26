//
//  Home.swift
//  Onboarding
//
//  Created by Mac Pro on 13/08/23.
//

import SwiftUI


struct Home: View {
    
    let persistence = PersistenceController.shared
    var body: some View {
        TabView {
            Menu()
                .tabItem {
                    Text("Menu")
                    Image(systemName: "list.bullet")
                }
                .environment(\.managedObjectContext, persistence.container.viewContext)
            //
            //            Maps()
            //                .tabItem {
            //                    Text("Maps")
            //                    Image(systemName: "map")
            //                }
            
            UserProfile()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "square.and.pencil")
                    
                    
                }
                .navigationBarBackButtonHidden(true)
        }
        
    }
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
    
}
