//
//  CollectionItem.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 27/03/25.
//

import SwiftData
import SwiftUI

@Model
class OrderItem : Identifiable {
    var id: UUID { menu.uuid }
    var menu: Menu
    var quantity: Int
    
    init(menu: Menu, quantity: Int) {
        self.menu = menu
        self.quantity = quantity
    }
}
