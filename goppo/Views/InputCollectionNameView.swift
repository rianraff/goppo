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
    
    @State private var collectionName: String = ""
    
    var order: [Int: Int]
    var menus: [Menu]
    
    var body: some View {
        VStack(spacing: 16.0) {
            VStack(alignment: .leading, spacing: 16.0) {
                
                Text("Nama Koleksi")
                    .frame(width: 361, height: 20, alignment: .leading)
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.leading)
                
                TextField("Berikan Nama Koleksi", text: $collectionName)
                    .padding(12)
                    //.background(Color.white)
                    .frame(width: 361)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.accentColor, lineWidth: 1)
                    )
            }
            
            Spacer()
            
            Button(action: {
                saveCollection()
            }) {
                Text("Buat Koleksi")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(width: 361, height: 48)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
        }
        .padding()
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
        
        let collection = Collection(
            id: newCollectionID,
            name: collectionName,
            total_price: total,
            imageName: imageName
        )
        
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
