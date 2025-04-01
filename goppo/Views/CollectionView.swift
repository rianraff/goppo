//
//  CollectionView.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI

struct CollectionView: View {
    let collections: [Collection] = [
        Collection(id: 1, name: "Bakso Lovers", total_price: 50000, imageName: "bakso_image"),
        Collection(id: 2, name: "Mie Ayam Fans", total_price: 40000, imageName: "mie_ayam_image")
    ]
    
    let collectionItems: [CollectionItem] = [
        CollectionItem(id: 1, menu_id: 1, quantity: 1, collection_id: 1),
        CollectionItem(id: 2, menu_id: 2, quantity: 2, collection_id: 1),
        CollectionItem(id: 3, menu_id: 3, quantity: 1, collection_id: 2)
    ]
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                // Navigation Header
                HStack {
                    Image(systemName: "chevron.backward")
                    
                    Spacer()
                    
                    Text("Pesanan Andalan")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                
                // List of Collections
                VStack {
                    ForEach(collections, id: \.id) { collection in
                        CollectionRow(
                            collection: collection,
                            collectionItems: collectionItems
                        )
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CollectionView()
}
