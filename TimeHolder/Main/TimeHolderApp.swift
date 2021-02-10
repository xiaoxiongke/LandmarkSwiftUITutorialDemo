//
//  TimeHolderApp.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import SwiftUI

@main
struct TimeHolderApp: App {
    @StateObject var modelData = ModelData()
    
    var body: some Scene {
        let mainWindow = WindowGroup {
            ContentView().environmentObject(modelData)
        }
        
        #if os(macOS)
        mainWindow
            .commands {
            LandmarkCommands()
        }
        #else
        mainWindow
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings{
            LandmarkSettings()
        }
        #endif
    }
}
