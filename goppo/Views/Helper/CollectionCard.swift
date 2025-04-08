
import SwiftUI

struct Collection_Card: View {@Environment(\.modelContext) private var modelContext // Inject SwiftData context
    
    var collection: Collection
    var collectionItems: [CollectionItem] // List of all collection items
    var menus: [Menu]
    var tenants: [Tenant]
    
    var filteredItems: [CollectionItem] {
        collectionItems.filter { $0.collection_id == collection.id }
    }
    
    //tenant yang ditampilin sesuai dengan collection
    var tenant: Tenant? {
        guard let firstItem = filteredItems.first,
              let menu = menus.first(where: { $0.id == firstItem.menu_id }),
              let tenant = tenants.first(where: { $0.id == menu.tenant_id }) else {
            return nil
        }
        return tenant
    }
    
    var initialOrder: [Int: Int] {
        var order: [Int: Int] = [:]
        for item in filteredItems {
            order[item.menu_id] = item.quantity
        }
        return order
    }
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.tertiarySystemBackground))
            
            VStack(alignment: .leading, spacing: 10.0){
                collection.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 4.0){
                    Text(collection.name)
                        .font(.body)
                        .fontWeight(.semibold)
                        //.foregroundStyle(.black)
                    Text("Rp \(collection.total_price, format: .number.precision(.fractionLength(0)))")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }

                NavigationLink(destination: ReceiptView(order: initialOrder)) {
                    Text("Pesan")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 32)
                        .background(Color.accent)
                        .cornerRadius(8)
                }
            }
            .padding(8)
        }
        .frame(width: 115, height: 207)
    }
}

//#Preview {
//    let sampleCollection = Collection(
//        id: 1,
//        name: "Bakso Lovers",
//        total_price: 50_000,
//        imageName: "bakso_image"
//    )
//    
//    let sampleItems = [
//        CollectionItem(id: 1, menu_id: 1, quantity: 1, collection_id: 1),
//        CollectionItem(id: 2, menu_id: 2, quantity: 2, collection_id: 1),
//        CollectionItem(id: 3, menu_id: 3, quantity: 1, collection_id: 2) // Not part of this collection
//    ]
//    
//    return Collection_Card(collection: sampleCollection, collectionItems: sampleItems)
//}
