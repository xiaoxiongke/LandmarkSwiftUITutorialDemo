//
//  Landmark.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category : Category
    
    var featureImage: Image?{
        guard isFeatured else {
            return nil
        }
        return Image(ImageStore.loadImage(name: "\(imageName)_featured"), scale: 2, label: Text(verbatim: name))
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    enum Category :  String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: self.imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
