//
//  LandmarkDetail.swift
//  MacLandmark
//
//  Created by 向宇涛 on 2021/2/9.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        ScrollView{
            ZStack(alignment: Alignment.init(horizontal: .trailing, vertical: .top)){
                MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                    .frame(height: 150)
                
                Button {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                    
                } label: {
                    Text("Open in Maps")
                }

            }.padding()
            
            VStack(alignment: .leading, spacing: 20){
                HStack(spacing: 24){
                    CircleImageView(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(landmark.name).font(.title).multilineTextAlignment(.leading).foregroundColor(.primary)
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(PlainButtonStyle())
                        }
                        VStack(alignment: .leading){
                            Text(landmark.park)
                            Text(landmark.state)
                        }.font(.subheadline).foregroundColor(.secondary)
                    }
                    
                    
                }
                
                Divider()
                
                Text("About \(landmark.name)").font(.title2)
                Text("\(landmark.park)")

            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
            
        }.navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
