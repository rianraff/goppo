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
                    .font(.system(size: 22, weight: .bold))
                
                TextField("Berikan Nama Koleksi", text: $collectionName)
                    .frame(maxWidth: .infinity)
                    .padding()
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
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            .disabled(collectionName.isEmpty)
        }
        .padding()
    }
    
    private func saveCollection() {
        guard !collectionName.isEmpty else { return }
        
        let newCollectionID = Int(Date().timeIntervalSince1970)
        let collection = Collection(id: newCollectionID, name: collectionName, total_price: 0, imageName: "default_image")
        
        modelContext.insert(collection)
        dismiss()
    }
}

//#Preview {
//    InputCollectionNameView()
//}
