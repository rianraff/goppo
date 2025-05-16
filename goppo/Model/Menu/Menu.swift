import SwiftData
import SwiftUI

enum MenuCategory: String, Codable {
    case food
    case drink
}

@Model
class Menu: Identifiable {
    var uuid: UUID
    var name: String
    var price: Int
    var category: MenuCategory
    @Relationship var tenant: Tenant
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(name: String, price: Int, category: MenuCategory, tenant: Tenant, imageName: String) {
        self.uuid = UUID()
        self.name = name
        self.price = price
        self.category = category
        self.tenant = tenant
        self.imageName = imageName
    }
}
