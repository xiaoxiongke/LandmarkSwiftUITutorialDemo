//
//  ContentView.swift
//  MacLandmark
//
//  Created by 向宇涛 on 2021/2/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(width: 800, height: 600)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
