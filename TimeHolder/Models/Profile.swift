//
//  Profile.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/9.
//

import Foundation

struct Profile{
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable{
        var id: String{ self.rawValue }
        case spring = "🌺"
        case summer  = "☀️"
        case autumn = "🍁"
        case winter = "⛄️"
    }
}
