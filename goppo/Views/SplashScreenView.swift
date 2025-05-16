//
//  SplashScreenView.swift
//  goppo
//
//  Created by Aissya Jelitawati on 09/04/25.
//

import SwiftUI
import SwiftData

struct SplashScreenView: View {
    @State private var isActive = false
    @Environment(\.modelContext) private var context
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        if isActive {
            HomeView()
                .environmentObject(appState)
        } else {
            ZStack {
                Color.accent
                    .ignoresSafeArea()
                VStack(spacing: 8) {
                    Image("Logo Trans 1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                    Text("GOPPO")
                        .font(Font.custom("FredokaOne-Regular", size: 45))
                        .foregroundStyle(.white)
                }
            }
            .task {
                do {
                    try await SampleDataSeeder.seedIfNeeded(context: context)
                    // After seeding completes, show home after a brief delay
                    try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay
                    withAnimation {
                        isActive = true
                    }
                } catch {
                    print("Seeding error: \(error)")
                    // Proceed anyway, or handle error accordingly
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}


#Preview {
    SplashScreenView()
}
