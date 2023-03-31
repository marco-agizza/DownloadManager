//
//  Download.swift
//  DownloadManager
//
//  Created by Marco Agizza on 23/03/23.
//

import Foundation

class Download: NSObject, URLSessionDownloadDelegate, Identifiable, ObservableObject {
    var id: UUID
    let name: String
    let creationDate: String
    var fileDimension: Double = 0.0
    @Published var progress: CGFloat
    var errorOccurred: Bool = false
    var completed: Bool = false
    private let sourceURL: URL
    private var alertMessage: String = ""
    var downloadSession: URLSession?
    //private let spentTime: Double
    
    
    init (id: UUID = UUID() , pathName: String, sourceURL: URL) {
        self.id = id
        self.name = sourceURL.lastPathComponent
        self.creationDate = takeMyFormatter().string(from: Date.now)
        self.sourceURL = sourceURL
        self.progress = 0
    }
    
    func startDownload() {
        downloadSession = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        
        let downloadTaskSession = downloadSession!.downloadTask(with: sourceURL)
        downloadTaskSession.resume()
    }
    
    func stopDownload() {
        
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
        print("I'm going to save the file in \(saveDirectoryPath)")
        let destinationURL = saveDirectoryPath.appendingPathComponent(url.lastPathComponent)
        
        try? FileManager.default.removeItem(at: destinationURL)
        
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
            completed.toggle()
            print("success")
        } catch {
            self.reportError(errorMessage: "Please try again later")
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            print("progress")
            self.progress = progress
        }
    }
}
