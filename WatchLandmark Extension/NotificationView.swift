//
//  NotificationView.swift
//  WatchLandmark Extension
//
//  Created by 向宇涛 on 2021/2/9.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack{
            if landmark != nil{
                CircleImageView(image: landmark!.image.resizable()).scaledToFit()
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)

            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }.lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
