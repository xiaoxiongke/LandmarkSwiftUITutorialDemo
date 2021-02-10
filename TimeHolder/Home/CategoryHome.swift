//
//  CategoryHome.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView{
            List{
                PageView(pages: modelData.features.map{ FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2 ,contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                    
                ForEach(modelData.categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featurd")
            .toolbar{
                Button(action: {
                    showingProfile.toggle()
                }, label: {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                })
            }
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost().environmentObject(modelData)
            })
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
