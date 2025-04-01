
import SwiftUI

struct Collection_Card: View {@Environment(\.modelContext) private var modelContext // Inject SwiftData context
    
    var collection: Collection
    var collectionItems: [CollectionItem] // List of all collection items

    var filteredItems: [CollectionItem] {
        collectionItems.filter { $0.collection_id == collection.id }
    }
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white) // Bisa diganti dengan .ultraThinMaterial untuk efek blur
            
            VStack(alignment: .leading, spacing: 10.0){
                collection.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 124, height: 124)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 4.0){
                    Text(collection.name)
                        .font(.body)
                        .fontWeight(.semibold)
                    Text(collection.total_price, format: .number.precision(.fractionLength(0)))
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                Button(action: {} ){
                    Text("Pesan")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 124, height: 32)
                        .background(Color.accent)
                        .cornerRadius(12)
                }
            }
            .frame(width: 140, height: 232)
        }
    }
}

#Preview {
    let sampleCollection = Collection(
        id: 1,
        name: "Bakso Lovers",
        total_price: 50_000,
        imageName: "bakso_image"
    )
    
    let sampleItems = [
        CollectionItem(id: 1, menu_id: 1, quantity: 1, collection_id: 1),
        CollectionItem(id: 2, menu_id: 2, quantity: 2, collection_id: 1),
        CollectionItem(id: 3, menu_id: 3, quantity: 1, collection_id: 2) // Not part of this collection
    ]
    
    return Collection_Card(collection: sampleCollection, collectionItems: sampleItems)
}
