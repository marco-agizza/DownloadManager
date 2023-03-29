//
//  ContentView.swift
//  DownloadManager
//
//  Created by Marco Agizza on 23/03/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject private var downloadManager: DownloadOrganizer
    
    @State private var selection: Tab = .starter
    
    enum Tab: String {
        case starter
        case downloads
    }
    

    var body: some View {
        TabView(selection: $selection) {
            DownloadStarterView().tabItem {
                Label("Creator", systemImage: "paperclip.circle.fill")
            }
            .tag(Tab.starter)
            
            DownloadsListView().tabItem {
                Label("Downloads", systemImage: "tray.and.arrow.down.fill")
            }
            .tag(Tab.downloads)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(DownloadOrganizer())
    }
}
