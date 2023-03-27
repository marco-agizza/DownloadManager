//
//  DownloadFileManager.swift
//  DownloadManager
//
//  Created by Marco Agizza on 23/03/23.
//

import SwiftUI

class DownloadFileManager: ObservableObject {
    @Published var downloadURL: URL!
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    func startDownload(downloadURL: String) {
        guard let validURL = URL(string: downloadURL) else {
            self.reportError(errorMessage: "Invalid URL !!!")
            return
        }
        
    }
    
    func reportError(errorMessage: String) {
        alertMessage = errorMessage
        showAlert.toggle()
    }
}
