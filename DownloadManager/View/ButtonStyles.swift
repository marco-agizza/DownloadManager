//
//  ButtonStyles.swift
//  DownloadManager
//
//  Created by Marco Agizza on 24/03/23.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .cornerRadius(15.0)
            .frame(minWidth: 130, minHeight: 45)
            .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.accentColor))
        //.scaleEffect(configuration.isPressed ? 1.05 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

struct WiderButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .cornerRadius(15.0)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.accentColor))
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

struct PrimaryRegularButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .cornerRadius(15.0)
            .frame(minWidth: 130, minHeight: 45)
            .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.accentColor))
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

struct SecondaryRegularButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.gray)
            .padding()
            .cornerRadius(15.0)
            .frame(minWidth: 130, minHeight: 45)
            .foregroundColor(Color.white)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.accentColor, lineWidth: 2)
            )
    }
}
