//
//  DownloadFileManager.swift
//  DownloadManager
//
//  Created by Marco Agizza on 23/03/23.
//

import SwiftUI

class DownloadOrganizer: ObservableObject {
    @Published var downloads: [Download] = []
    
    func insertNewDownload(_ download: Download) {
        self.downloads.insert(download, at: 0)
    }
    
    // MARK: - File I/O

    func refreshOrganizer() {
        let defaultDownloads = defaultDownloads().shuffled()
        for download in defaultDownloads {
            download.id = UUID()
            insertNewDownload(download)
        }
    }

    func defaultDownloads() -> [Download] {
        DownloadManager.load("Downloads.json")
    }
}
