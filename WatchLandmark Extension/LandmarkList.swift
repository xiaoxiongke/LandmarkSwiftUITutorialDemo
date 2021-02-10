//
//  LandmarkList.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var showFavriteOnly: Bool = false
    
    var filtedLandmarksList: [Landmark] {
        modelData.landmarks.filter { (landmark) -> Bool in
            return landmark.isFavorite || !showFavriteOnly
        }
    }
    
    var body: some View {
        NavigationView(content: {
            List{
                Toggle(isOn: $showFavriteOnly, label: {
                    Text("Favirates only")
                })
                
                ForEach(filtedLandmarksList) { (landmark)  in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
            }.navigationTitle("Landmakrs")
        })
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
