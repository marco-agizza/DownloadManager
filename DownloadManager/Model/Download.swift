//
//  Download.swift
//  DownloadManager
//
//  Created by Marco Agizza on 23/03/23.
//

import Foundation

class Download: NSObject, URLSessionDownloadDelegate, Identifiable, Codable {
    var id: UUID
    private let name: String
    private let creationDate: Date
    private let fileDimension: Double
    private let sourceURL: String
    private var progress: CGFloat
    private var errorOccurred: Bool = true
    private var alertMessage: String = ""
    //private let spentTime: Double
    
    
    init (id: UUID = UUID() , pathName: String, fileDimension: Double, sourceURL: String) {
        self.id = id
        self.name = pathName
        self.creationDate = Date.now
        self.fileDimension = fileDimension
        self.sourceURL = sourceURL
        self.progress = 0
    }
    
    func startDownload() {
        guard let validURL = URL(string: sourceURL) else {
            errorOccurred.toggle()
            return
        }
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        
        let downloadTaskSession = session.downloadTask(with: validURL)
        downloadTaskSession.resume()
    }
    
    func reportError(errorMessage: String) {
        alertMessage = errorMessage
        errorOccurred.toggle()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let url = downloadTask.originalRequest?.url else {
            self.reportError(errorMessage: "Something went wrong. Please try again later")
            return
        }
        
        let saveDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let destinationURL = saveDirectoryPath.appendingPathComponent(url.lastPathComponent)
        
        try? FileManager.default.removeItem(at: destinationURL)
        
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
        } catch {
            self.reportError(errorMessage: "Please try again later")
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            self.progress = progress
        }
    }
}
