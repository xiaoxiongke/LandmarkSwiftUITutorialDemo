//
//  LandmarkDetail.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        VStack{
            MapView(coordinate: landmark.locationCoordinate)
            .ignoresSafeArea(edges: .top)
                .frame(height: 150)
            
            CircleImageView(image: landmark.image).offset(y: -150).padding(.bottom, -150)
            
            VStack(alignment: .leading){
                HStack{
                    Text(landmark.name).font(.title).multilineTextAlignment(.leading).foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    
                }
                VStack{
                    HStack{
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }.font(.subheadline).foregroundColor(.secondary)
                }
                
                Divider()
                
                Text("About \(landmark.name)").font(.title2)
                Text("\(landmark.park)")
            }.padding()
            
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0]).environmentObject(modelData)
    }
}
