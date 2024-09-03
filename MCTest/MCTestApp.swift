//
//  MCTestApp.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

import SwiftUI

@main
struct MCTestApp: App {
    @State private var showSplashScreen = true

    var body: some Scene {
        WindowGroup {
            if showSplashScreen {
                SplashScreenView()
                    .onAppear {
                        // Simular un tiempo de splash screen
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplashScreen = false
                            }
                        }
                    }
            } else {
                CharacterListView(viewModel: DependencyInjector.shared.provideCharacterListViewModel())
            }
        }
    }
}
