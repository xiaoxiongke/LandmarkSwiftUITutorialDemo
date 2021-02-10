//
//  MapView.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    enum Zoom: String, CaseIterable, Identifiable {
            case near = "Near"
            case medium = "Medium"
            case far = "Far"

            var id: Zoom {
                return self
            }
        }
    
    @AppStorage("MapView.zoom")
        private var zoom: Zoom = .medium
    
    var delta: CLLocationDegrees {
            switch zoom {
            case .near: return 0.02
            case .medium: return 0.2
            case .far: return 2
            }
        }
    
    var region: MKCoordinateRegion{
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
    
    var body: some View {
        Map(coordinateRegion: .constant(region))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.0113, longitude: -116.3112))
    }
}
