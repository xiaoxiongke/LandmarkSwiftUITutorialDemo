//
//  HikeDetail.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation
    
    var buttons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace),
    ]
    
    var body: some View {
        return VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200, alignment: .center)
            
            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button(action: {
                        self.dataToShow = value.1
                    }) {
                        Text(verbatim: value.0)
                            .font(.system(size: 15))
                            .foregroundColor(value.1 == self.dataToShow
                                ? Color.gray
                                : Color.accentColor)
                            .animation(nil)
                    }
                }
            }
        }
    }
}


struct HikeDetai_Preview : PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: ModelData().hikeData[0])
    }
}
