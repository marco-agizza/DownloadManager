//
//  DownloadsListView.swift
//  DownloadManager
//
//  Created by Marco Agizza on 29/03/23.
//

import SwiftUI

struct DownloadsListView: View {
    @EnvironmentObject private var downloadOrganizer: DownloadOrganizer
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach($downloadOrganizer.downloads) { $download in
                        SingleDownloadView(download: download)
                    }
                }
            }
            .navigationTitle("Previous downloads")
        }
    }
}

/*
struct DownloadsListView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadsListView()
    }
}
*/
