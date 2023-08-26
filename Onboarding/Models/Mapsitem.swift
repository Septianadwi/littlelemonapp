//
//  Mapsitem.swift
//  Onboarding
//
//  Created by Mac Pro on 23/08/23.
//
//
import Foundation
import CoreLocation

struct MapPinAnnotation: Decodable {
    let menu: [RestaurantLocation]
}

struct RestaurantLocation: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}
