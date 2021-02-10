//
//  HikeBadge.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/9.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center){
            BadgeView()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0/3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name)")
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
