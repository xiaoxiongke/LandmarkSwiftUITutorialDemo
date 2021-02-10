//
//  BadgeView.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

struct BadgeView: View {
    
    static let rotationCount = 8
    
    var badgedSymbles : some View{
        ForEach(0..<BadgeView.rotationCount) { i in
            RotatedBadgeSymbleView(angle: Angle(degrees: (Double(i) / Double(BadgeView.rotationCount) * 360) )).opacity(0.5)
        }
    }
    
    var body: some View {
        ZStack{
            BadgeBackground()

            GeometryReader{ geometry in
                badgedSymbles.scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 3.0 / 4.0)
            }
        }.scaledToFit()
        
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
