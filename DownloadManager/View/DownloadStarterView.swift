//
//  DownloadStarterView.swift
//  DownloadManager
//
//  Created by Marco Agizza on 29/03/23.
//

import SwiftUI

struct DownloadStarterView: View {
    @State private var urlLink: String = ""
    
    var body: some View {
            NavigationStack {
                VStack(alignment: .leading) {
                    Text("Paste the link for the resource you want to download.")
                        .multilineTextAlignment(.leading)
                    Spacer()
                        .frame(height: 200)
                    VStack (alignment: .center) {
                        TextField("Insert the url here", text: $urlLink)
                            .frame(height: 38)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.06), radius: 5)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 20)
                        HStack {
                            Button(
                                action: {/*downloadManager.startDownload(downloadURL: urlLink)*/},
                                label: {Text("Download")}
                            )
                            .buttonStyle(PrimaryRegularButtonStyle())
                            Button(
                                action: {urlLink = ""},
                                label: {Text("Clear")}
                            )
                            .buttonStyle(SecondaryRegularButtonStyle())
                        }
                    }
                    Spacer()
                }
                .navigationTitle("Downloader")
                .padding()
            }
            /*.alert(
                isPresented: $downloadManager.showAlert,
                content: {
                    Alert(title: Text("Error message"),
                          message: Text(downloadManager.alertMessage),
                          dismissButton: .destructive(
                            Text("Got it"),
                            action: {}
                          )
                    )
                }
            )*/
        }
}

struct DownloadStarterView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadStarterView()
    }
}
