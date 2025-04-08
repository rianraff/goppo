//
//  CollectionView.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI
import SwiftData

struct CollectionView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var collections: [Collection]
    @Query var collectionItems: [CollectionItem]
    @Query var tenants: [Tenant]
    @Query var menus: [Menu]

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
                
            VStack {
                List {
                    ForEach(collections, id: \.id) { collection in
                        CollectionRow(
                            collection: collection,
                            collectionItems: collectionItems,
                            menus: menus,
                            tenants: tenants
                        )
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                deleteCollection(collection)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Pesanan Andalanmu")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
    
    private func deleteCollection(_ collection: Collection) {
        let relatedItems = collectionItems.filter { $0.collection_id == collection.id }
        for item in relatedItems {
            modelContext.delete(item)
        }
        modelContext.delete(collection)
        try? modelContext.save()
    }
}


//#Preview {
//    CollectionView()
//}
