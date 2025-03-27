//
//  goppoApp.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 26/03/25.
//

import SwiftUI
import Foundation
import SwiftData

@main
struct goppoApp: App {
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: [Menu.self, Tenant.self], inMemory: false)
        }
    }
}
