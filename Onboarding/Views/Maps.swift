//
//  Maps.swift
//  Onboarding
//
//  Created by Mac Pro on 23/08/23.
//
//
//import SwiftUI
//import MapKit
//
//struct RestaurantLocation: Identifiable, Hashable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//}
//
//struct Maps: View {
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: -6.2088, longitude: 106.8456),
//        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//    )
//    
//    // Sample restaurant locations
//    var restaurantLocations: [RestaurantLocation] = [
//        RestaurantLocation(name: "Restaurant A", coordinate: CLLocationCoordinate2D(latitude: -6.2088, longitude: 106.8456)),
//        RestaurantLocation(name: "Restaurant B", coordinate: CLLocationCoordinate2D(latitude: -6.2188, longitude: 106.8556)),
//        RestaurantLocation(name: "Restaurant C", coordinate: CLLocationCoordinate2D(latitude: -6.1988, longitude: 106.8356))
//    ]
//    
//    var annotationItems: [MapAnnotation<RestaurantLocation>] {
//        return restaurantLocations.map { location in
//            MapAnnotation(coordinate: location.coordinate) {
//                Image(systemName: "mappin")
//                    .foregroundColor(.red)
//                    .onTapGesture {
//                        // Handle annotation tap, e.g., show restaurant details
//                    }
//            }
//        }
//    }
//    
//    @State private var userTrackingMode: MapUserTrackingMode = .follow
//    
//    var body: some View {
//        NavigationView {
//            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: $userTrackingMode, annotationItems: annotationItems) { item in
//                MapPin(coordinate: item.coordinate, tint: .blue)
//            }
//            .gesture(DragGesture().onChanged { value in
//                let translation = value.translation
//                let deltaLat = -translation.height / 1000.0
//                let deltaLong = translation.width / 1000.0
//                let newCenter = CLLocationCoordinate2D(
//                    latitude: region.center.latitude + deltaLat,
//                    longitude: region.center.longitude + deltaLong
//                )
//                region.center = newCenter
//            })
//            .onAppear {
//                // Optionally, you can update restaurant locations here
//            }
//            .navigationBarTitle("Restaurant Locations", displayMode: .inline)
//            .navigationBarBackButtonHidden(false)
//        }
//    }
//}
//
//struct Maps_Previews: PreviewProvider {
//    static var previews: some View {
//        Maps()
//    }
//}
