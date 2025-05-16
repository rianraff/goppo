//
//  Collection.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 27/03/25.
//

import SwiftData
import SwiftUI
import AppIntents

@Model
class Collection : Identifiable {
    @Attribute(.unique) var uuid: UUID
    var name: String
    var order: Order = Order(orderItems: [])
    
    var imageName: String = "dummy_food"
    var image: Image {
        Image(imageName)
    }
    
    init(name: String) {
        self.uuid = UUID()
        self.name = name
    }
}

extension Collection {
    func updateOrder(order: Order) -> Void {
        self.order = order
    }
    
    func countOrderItems() -> Int {
        order.orderItems.count
    }
}
