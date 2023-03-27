//
//  ContentView.swift
//  DownloadManager
//
//  Created by Marco Agizza on 23/03/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    /*
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    */
    
    @ObservedObject var downloadManager: DownloadFileManager
    @State var urlLink: String = ""

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
                            action: {downloadManager.startDownload(downloadURL: urlLink)},
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
            .navigationTitle("File downloader")
            .padding()
        }
        .alert(
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
        )
    }
/*
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
 */
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let downloadManager = DownloadFileManager()
        ContentView(downloadManager: downloadManager).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
