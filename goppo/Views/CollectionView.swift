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

    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(collections, id: \.id) { collection in
                        CollectionRow(collection: collection)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                deleteCollection(collection: collection)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Koleksi")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func deleteCollection(collection: Collection) {
        modelContext.delete(collection)
        try? modelContext.save()
    }
}


//#Preview {
//    CollectionView()
//}
