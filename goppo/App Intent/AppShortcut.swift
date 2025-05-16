//
//  AppShortcut.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 16/05/25.
//

import AppIntents
import SwiftData
import UIKit

struct GoppoShortcuts: AppShortcutsProvider {
    @AppShortcutsBuilder static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: OrderTopCollectionIntent(),
            phrases: ["Copy my favourite collection in ${applicationName}", "Get my favourite collection order from ${applicationName}"],
            shortTitle: "Copy Favourite Order",
            systemImageName: "doc.on.doc"
        )
        
        AppShortcut(
            intent: CopyCollectionOrderIntent(),
            phrases: ["Copy order from \(.applicationName)", "Copy order from a collection in \(.applicationName)"],
            shortTitle: "Copy Specific Order",
            systemImageName: "doc.on.doc"
        )
    }
    
    static var shortcutTileColor: ShortcutTileColor {
        .blue // You can change this to your app's preferred color
    }
}
