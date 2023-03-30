//
//  SingleDownloadView.swift
//  DownloadManager
//
//  Created by Marco Agizza on 29/03/23.
//

import SwiftUI

struct SingleDownloadView: View {
    @ObservedObject var download: Download
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(download.name)
                Text(download.creationDate.description)
            }
            if download.progress == 1 {
                Text(Image(systemName: "checkmark.circle.fill"))
            } else {
                switch download.errorOccurred {
                case true:
                    Text(Image(systemName: "xmark"))
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                        .font(.title)
                case false:
                    DownloadProgressView(progress: download.progress)
                }
            }
        }
    }
}

struct SingleDownloadView_Previews: PreviewProvider {
    static var previews: some View {
        let download = Download(pathName: "Sample", sourceURL: URL(string: "https://decapoda.nhm.org/pdfs/25900/25900.pdf")!)
        SingleDownloadView(download: download)
    }
}
