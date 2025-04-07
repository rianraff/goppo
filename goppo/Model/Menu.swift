import SwiftData
import SwiftUI

@Model
class Menu {
    var id: Int
    var name: String
    var price: Double
    var category: String
    var tenant_id: Int
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(id: Int, name: String, price: Double, imageName: String, category: String, tenant_id: Int) {
            self.id = id
            self.name = name
            self.price = price
            self.imageName = imageName  // Set private property
            self.category = category
            self.tenant_id = tenant_id
        }
}
