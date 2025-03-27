import Foundation

struct Menu: Codable, Identifiable {
    var id: Int
    var name: String
    var price: Double
    var image: String
    var category: String
    var tenant_id: String
    
    init(
        id: Int,
        name: String,
        price: Double,
        image: String,
        category: String,
        tenant_id: String
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.image = image
        self.category = category
        self.tenant_id = tenant_id
        GopoSeederData.seed()
    }
}
