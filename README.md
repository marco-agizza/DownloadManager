# DownloadManager
## About
This project demonstrates the use of URLSessionDownloadDelegate and URLSession in a SwiftUI application to allow users to download files from the internet while displaying the progress of the download through a progress bar.

## Requirements
* Xcode 12 or later
* iOS 13 or later

## Getting Started
1. Clone the repository;
2. Open the Xcode project in `SwiftUI-URLSessionDownloadDelegate`;
3. Build and run the project on your iOS device or simulator.

## Features
This app allows users to:
* Enter a URL to download a file;
* View the progress of the download in a progress bar;
* Cancel the download.

## How it Works
1. The user enters a URL to download a file.
2. The app creates a `URLSession` object and sets itself as the delegate for the `downloadSession` task.
3. The app starts the download task with the given URL.
4. The app receives updates on the download progress through the `URLSessionDownloadDelegate`.
5. The app updates the UI with the progress information received from the delegate.
6. The user can cancel the download through the UI.
7. The app updates the download task with the user's action, and the download progress information is updated accordingly.

## Technologies Used
* SwiftUI for the user interface;
* URLSessionDownloadDelegate for downloading files from the internet and take track of the progress of the download;
* DispatchQueue for updating the UI on the main thread.

## License

The original setup of this repository is by [Marco Agizza](https://github.com/marco-agizza).
