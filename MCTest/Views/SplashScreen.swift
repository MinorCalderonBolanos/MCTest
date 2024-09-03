//
//  SplashScreen.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // Fondo blanco
            Image("splashscreen")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
        }
        .ignoresSafeArea() // Extiende el contenido hasta los bordes
    }
}
