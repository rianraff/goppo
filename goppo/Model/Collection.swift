//
//  Collection.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 27/03/25.
//

import SwiftData
import SwiftUI

@Model
class Collection {
    var id: Int
    var name: String
    var total_price: Double
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(id: Int, name: String, total_price: Double, imageName: String) {
        self.id = id
        self.name = name
        self.total_price = total_price
        self.imageName = imageName
    }
}
