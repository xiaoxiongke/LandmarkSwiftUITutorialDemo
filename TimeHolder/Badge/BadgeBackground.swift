//
//  BadgeBackground.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

struct BadgeBackground: View {
    
    let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        GeometryReader{ geometry in
            Path{path in
                let width : CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                path.move(to: CGPoint(
                    x: width * 0.95,
                    y: height * (0.20 + HexagonParameter.adjustment)
                    )
                )
                
                HexagonParameter.segments.forEach { (segment) in
                    path.addLine(to: CGPoint(x: segment.line.x * width, y: segment.line.y * height))
                    path.addQuadCurve(to: CGPoint(x: segment.curve.x * width, y: segment.curve.y * height), control: CGPoint(x: segment.control.x * width, y: segment.control.y * height))
                }
            }
            .fill(LinearGradient(gradient: Gradient(colors: [gradientStart, gradientEnd]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.6)))
            
        }.aspectRatio(1, contentMode: .fit)
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
