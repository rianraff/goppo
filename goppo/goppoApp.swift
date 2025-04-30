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
            
                SplashScreenView()
            
            .modelContainer(for: [Menu.self, Tenant.self, Collection.self, CollectionItem.self], inMemory: false)
        }
    }
}
