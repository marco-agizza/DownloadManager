//
//  Utils.swift
//  DownloadManager
//
//  Created by Marco Agizza on 30/03/23.
//

import Foundation

func takeMyFormatter() -> DateFormatter {
    let myFormatter = DateFormatter()
    myFormatter.dateFormat = "dd/MM/y HH:mm"
    return myFormatter
}
