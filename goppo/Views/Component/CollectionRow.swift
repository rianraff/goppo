//
//  KoleksiCard.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI
import SwiftData

struct CollectionRow: View {
    @Environment(\.modelContext) private var modelContext // Inject SwiftData context
    
    var collection: Collection
    
    var body: some View {
        
        NavigationLink(destination: {
            ReceiptView(order: collection.order)
        }){
                HStack(spacing: 15.0) {
                    collection.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 97, height: 97)
                        .clipShape(Rectangle())
                        .cornerRadius(8)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 10.0) {
                        VStack(alignment: .leading) {
                            Text(collection.name)
                                .font(.body)
                                .fontWeight(.semibold)
                            //.foregroundStyle(.black)
                            
                            Text(collection.order.orderSummary) // Dynamically show menu items
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundStyle(Color.secondary)
                        }
                        
                        Text("Rp\(collection.order.totalPrice, format: .number)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    
                    Spacer()
                    }
                }
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
//    return CollectionRow(collection: sampleCollection, collectionItems: sampleItems)
//}
