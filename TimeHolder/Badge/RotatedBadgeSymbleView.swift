//
//  RotatedBadgeSymbleView.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

struct RotatedBadgeSymbleView: View {
    let angle : Angle
    var body: some View {
        BadgeSymble().padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbleView_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbleView(angle: Angle(degrees: 5))
    }
}
