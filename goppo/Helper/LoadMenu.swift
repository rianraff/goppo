//
//  LoadMenu.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 27/03/25.
//

import SwiftData
import Foundation

func loadMenuData() -> [LocalMenu] {
    guard let url = Bundle.main.url(forResource: "menuData", withExtension: "json"),
          let data = try? Data(contentsOf: url) else {
        return []
    }
    let decoder = JSONDecoder()
    return (try? decoder.decode([LocalMenu].self, from: data)) ?? []
}

@MainActor
func seedMenuDatabase(context: ModelContext) async {
    let existingMenus = (try? context.fetch(FetchDescriptor<Menu>())) ?? []
    
    // Avoid duplicate inserts
    if !existingMenus.isEmpty { return }
    
    let localMenus = loadMenuData()
    for localMenu in localMenus {
        let newMenu = localMenu.toMenu()
        context.insert(newMenu)
    }
    
    try? context.save()
    
    // Fetch and print the stored menus
    let storedMenus = (try? context.fetch(FetchDescriptor<Menu>())) ?? []
    
    print("Successfully inserted \(storedMenus.count) menu items:")
    for menu in storedMenus.prefix(5) { // Print first 5 menus
        print("🍽️ \(menu.name) - \(menu.price) - \(menu.category)")
    }
}
