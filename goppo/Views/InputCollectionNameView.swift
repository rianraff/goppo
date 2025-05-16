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
    
    @State private var collectionName: String = ""
    @Binding var newCollectionId: UUID?
    
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
        let trimmedName = collectionName.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedName.isEmpty else { return }

        let newCollectionID = UUID()
        let collection = Collection(name: trimmedName)

        newCollectionId = newCollectionID
        modelContext.insert(collection)
        dismiss()
    }
}

//#Preview {
//    InputCollectionNameView()
//}
