//
//  MenuLoad.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 26/03/25.
//

import Foundation

struct LocalMenu: Codable {
    let id: Int
    let name: String
    let price: Double
    let category: String
    let tenant_id: Int
    let imageName: String

    func toMenu() -> Menu {
        return Menu(id: id, name: name, price: price, imageName: imageName, category: category, tenant_id: tenant_id)
    }
}
