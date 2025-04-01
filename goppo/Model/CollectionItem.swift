//
//  CollectionItem.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 27/03/25.
//

import SwiftData

@Model
class CollectionItem {
    var id: Int
    var menu_id: Int
    var quantity: Int
    var collection_id: Int
    
    init(id: Int, menu_id: Int, quantity: Int, collection_id: Int) {
        self.id = id
        self.menu_id = menu_id
        self.quantity = quantity
        self.collection_id = collection_id
    }
}
