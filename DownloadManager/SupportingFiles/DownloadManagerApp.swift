//
//  DownloadManagerApp.swift
//  DownloadManager
//
//  Created by Marco Agizza on 23/03/23.
//

import SwiftUI

@main
struct DownloadManagerApp: App {
    @StateObject private var downloadManager = DownloadOrganizer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(downloadManager)
        }
    }
}
