//
//  CircleImageView.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

struct CircleImageView: View {
    var image: Image
    var body: some View {
        image.aspectRatio(contentMode: .fit).clipShape(Circle()).overlay(Circle().stroke(Color.white,lineWidth: 4)).shadow(radius: 7)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("turtlerock"))
    }
}
