//
//  DownloadProgressView.swift
//  DownloadManager
//
//  Created by Marco Agizza on 28/03/23.
//

import SwiftUI

struct DownloadProgressView: View {
    // TODO: add ref to
    var progress: CGFloat
    
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                    
                    ProgressShape(progress: progress)
                        .fill(Color.gray.opacity(0.45))
                        .rotationEffect(.init(degrees: -90))
                    Button(
                        action: {/*code to stop the download*/},
                        label: {
                            Text(Image(systemName: "stop.fill"))
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    )
                }
                .frame(width: 70, height: 70)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 50)
            .background(Color.white)
            .cornerRadius(10)
        }
    }
}

struct DownloadProgressView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadProgressView(progress: 0.5)
    }
}

struct ProgressShape: Shape {
    var progress: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 35, startAngle: .zero, endAngle: .init(degrees: progress * 360), clockwise: false)
        }
    }
}
