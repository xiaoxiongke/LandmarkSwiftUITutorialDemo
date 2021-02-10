//
//  LandmarkList.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavriteOnly: Bool = false
    @State private var filter:FilterCategory = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
            case all = "All"
            case lakes = "Lakes"
            case rivers = "Rivers"
            case mountains = "Mountains"

            var id: FilterCategory { self }
        }
    
    var filtedLandmarksList: [Landmark] {
        modelData.landmarks.filter { (landmark) -> Bool in
            return (landmark.isFavorite || !showFavriteOnly) && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String{
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavriteOnly ?  "Favorite \(title)"  : title
    }
    
    var index: Int?{
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        NavigationView(content: {
            List(selection: $selectedLandmark){
                Toggle(isOn: $showFavriteOnly, label: {
                    Text("Favirates only")
                })
                
                ForEach(filtedLandmarksList) { (landmark)  in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }.navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem{
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases){ category in
                                Text(category.rawValue).tag(category)
                            }
                        }.pickerStyle(InlinePickerStyle())
                        
                        Toggle(isOn: $showFavriteOnly) {
                            Label("Favorites Only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                    
                }
            }
            Text("Select a Landmark")
        })
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
