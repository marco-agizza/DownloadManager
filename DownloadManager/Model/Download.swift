//
//  Download.swift
//  DownloadManager
//
//  Created by Marco Agizza on 23/03/23.
//

import Foundation

struct Download {
    private let pathName: String
    private let creationDate: Date
    private let fileDimension: Double
    private let spentTime: Double
    
    init (pathName: String, fileDimension: Double, spentTime: Double) {
        self.pathName = pathName
        self.creationDate = Date.now
        self.fileDimension = fileDimension
        self.spentTime = spentTime
    }
}
