//
//  LandmarkDetail.swift
//  WatchLandmark Extension
//
//  Created by 向宇涛 on 2021/2/9.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData

    var landmark: Landmark

    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView{
            VStack{
                CircleImageView(image: landmark.image.resizable()).scaledToFill()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption2)
                
                Divider()
                
                MapView(coordinate: CLLocationCoordinate2D(latitude: landmark.locationCoordinate.latitude, longitude: landmark.locationCoordinate.longitude))
                    .scaledToFit()
                
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0]).environmentObject(ModelData())
    }
}
