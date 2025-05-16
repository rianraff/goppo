//
//  goppoApp.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 26/03/25.
//

import SwiftUI
import Foundation
import SwiftData

// Make sure context is passed correctly in the app initialization
@main
struct goppoApp: App {
    @Environment(\.modelContext) private var context // Add this to access the context
    @StateObject private var appState = AppState.shared
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .modelContainer(for: [Menu.self, Tenant.self, Collection.self], inMemory: false)
                .task {
                    try? await SampleDataSeeder.seedIfNeeded(context: context)
                }
                .environmentObject(appState)
        }
    }
}
