//
//  Order.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 14/05/25.
//

import SwiftUI
import SwiftData

@Model
class Order: Identifiable {
    var id: UUID
    var totalPrice: Int
    var orderItems: [OrderItem] = []
    var orderSummary: String = "No items in this collection."
    
    init(orderItems: [OrderItem]) {
        self.id = UUID()
        self.orderItems = orderItems
        self.totalPrice = Order.setTotalPrice(orderItems: orderItems)
        self.orderSummary = Order.setOrderSummary(orderItems: orderItems)
    }
}

extension Order {
    
    static func setTotalPrice(orderItems: [OrderItem]) -> Int {
        return orderItems.reduce(0) { result, item in
            result + Int(item.menu.price) * item.quantity
        }
    }
    
    static func setOrderSummary(orderItems: [OrderItem]) -> String {
        guard !orderItems.isEmpty else {
            return "No items in this collection."
        }
        
        let items = orderItems.map { item in
            "\(item.menu.name) (\(item.quantity))"
        }
        
        return items.joined(separator: ", ") + "."
    }
    
    func addOrderItem(newItem: OrderItem) {
        if let index = orderItems.firstIndex(where: { $0.menu.uuid == newItem.menu.uuid }) {
            orderItems[index].quantity += newItem.quantity
        } else {
            orderItems.append(newItem)
        }
        
        self.totalPrice = Order.setTotalPrice(orderItems: orderItems)
        self.orderSummary = Order.setOrderSummary(orderItems: orderItems)
    }
    
    func setQuantity(for menu: Menu, quantity: Int) {
        if let index = orderItems.firstIndex(where: { $0.menu.uuid == menu.uuid }) {
            if quantity == 0 {
                orderItems.remove(at: index)
            } else {
                orderItems[index].quantity = quantity
            }
        } else if quantity > 0 {
            orderItems.append(OrderItem(menu: menu, quantity: quantity))
        }
        
        self.totalPrice = Order.setTotalPrice(orderItems: orderItems)
        self.orderSummary = Order.setOrderSummary(orderItems: orderItems)
    }
    
    func quantity(for menu: Menu) -> Int {
        return orderItems.first(where: { $0.menu.uuid == menu.uuid })?.quantity ?? 0
    }
    
    var isEmpty: Bool {
        orderItems.isEmpty
    }
}

