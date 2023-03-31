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
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color.gray.opacity(0.3))
                    
                    ProgressShape(progress: progress)
                        .fill(Color.gray.opacity(0.5))
                        .rotationEffect(.init(degrees: -90))
                        .fontWeight(.bold)
                        .font(.title)
                }
                .frame(width: 40, height: 40)
            }
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
            
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 20, startAngle: .zero, endAngle: .init(degrees: progress * 360), clockwise: false)
        }
    }
}
