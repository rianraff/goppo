//
//  InputCollectionNameView.swift
//  goppo
//
//  Created by Michelle PL on 07/04/25.
//

import SwiftUI
import SwiftData

struct InputCollectionNameView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query var collections: [Collection]
    @State private var collectionName = ""
    
    var order: [Int: Int]
    var menus: [Menu]
    
    var body: some View {
        VStack {
            TextField("Collection Name", text: $collectionName)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Button("Save Collection") {
                saveCollection()
            }
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding()
        .navigationTitle("New Collection")
    }
    
    private func saveCollection() {
        guard !collectionName.isEmpty else { return }
        
        let firstMenuID = order.keys.first
        let imageName = menus.first(where: { $0.id == firstMenuID })?.imageName ?? "default_image"
        
        let total = order.reduce(0) { total, entry in
            let (menuID, quantity) = entry
            if let menu = menus.first(where: { $0.id == menuID }) {
                return total + (menu.price * Double(quantity))
            }
            return total
        }
        
        let newCollectionID = Int(Date().timeIntervalSince1970)
        
        let collection = Collection(id: newCollectionID,
                                     name: collectionName,
                                     total_price: total,
                                     imageName: imageName)
        modelContext.insert(collection)
        
        for (menuID, quantity) in order {
            let item = CollectionItem(
                id: Int(Date().timeIntervalSince1970 * 1000) + menuID,
                menu_id: menuID,
                quantity: quantity,
                collection_id: newCollectionID
            )
            modelContext.insert(item)
        }
    
        dismiss()
    }

}

//#Preview {
//    InputCollectionNameView()
//}
