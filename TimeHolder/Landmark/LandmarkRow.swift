//
//  LandmarkRow.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image.resizable().frame(width: 50, height: 50)
                .cornerRadius(5)
            
            VStack(alignment: .leading){
                Text(landmark.name)
                    .bold()
                
                #if !os(watchOS)
                    Text(landmark.park)
                        .font(.caption)
                        .foregroundColor(.secondary)
                #endif
            }
            
            Spacer()
            
            if(landmark.isFavorite){
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }.padding(.vertical, 4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        Group{
            LandmarkRow(landmark: modelData.landmarks[0]).previewLayout(.fixed(width: 300, height: 70)).environmentObject(modelData)
            LandmarkRow(landmark: modelData.landmarks[0]).previewLayout(.fixed(width: 300, height: 70)).environmentObject(modelData)
        }
    }
}
