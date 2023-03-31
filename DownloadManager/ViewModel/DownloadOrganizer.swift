//
//  DownloadFileManager.swift
//  DownloadManager
//
//  Created by Marco Agizza on 23/03/23.
//

import SwiftUI

let tempDownloadName: String = "Download n-th"

class DownloadOrganizer: ObservableObject {
    @Published var downloads: [Download] = []
    @Published var errorOccurred = false
    @Published var errorMessage = ""
    
    func startNewDownload(sourceURL: String) {
        guard let validURL = URL(string: sourceURL) else {
            errorMessage = "Error occurred"
            errorOccurred.toggle()
            return
        }
        let newDownload = Download(pathName: tempDownloadName, sourceURL: validURL)
        newDownload.startDownload()
        insertNewDownload(newDownload)
    }
    
    func insertNewDownload(_ download: Download) {
        self.downloads.insert(download, at: 0)
    }
    
    // MARK: - File I/O

    /*
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
    */
}
