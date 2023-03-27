//
//  DownloadManagerApp.swift
//  DownloadManager
//
//  Created by Marco Agizza on 23/03/23.
//

import SwiftUI

@main
struct DownloadManagerApp: App {
    let persistenceController = PersistenceController.shared
    let downloadManager = DownloadFileManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(downloadManager: downloadManager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
