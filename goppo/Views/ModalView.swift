//
//  ModalCollectionView.swift
//  goppo
//
//  Created by Aissya Jelitawati on 28/03/25.
//

import SwiftUI
import SwiftData

struct ModalView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var menus: [Menu]
    @Query var collections: [Collection]
    @Query var CollctionItems: [CollectionItem]
    @State private var selectedCollectionID: Int? = nil
    @State private var showAlert = false
    @Environment(\.dismiss) private var dismiss

    var order: [Int: Int]
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 12.0) {
                Spacer()
                VStack (alignment: .leading, spacing: 8.0) {
                    Text("Simpan ke Koleksi")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Tambahkan menu ke koleksi pesanan andalanmu!")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                }
                .padding(.trailing)
                
                ScrollView {
                    VStack (spacing: 2) {
                        ForEach(collections, id: \.id) { collection in
                            CollectionRadio(collection: collection, isSelected: selectedCollectionID == collection.id, onTap: {
                                selectedCollectionID = collection.id
                            })
                                .onAppear {
                                    print("Collection Name: \(collection.name)")
                                    
                                    // Find all items belonging to this collection
                                    let itemsInCollection = CollctionItems.filter { $0.collection_id == collection.id }
                                    
                                    for item in itemsInCollection {
                                        if let menu = menus.first(where: { $0.id == item.menu_id }) {
                                            print("Menu in Collection: \(menu.tenant_id)")
                                        }
                                    }
                                }
                                
                        }

                    }
                }
                .frame(height: 250)
                
                VStack(spacing: 8.0) {
                    NavigationLink(destination: InputCollectionNameView(order: order, menus: menus)){
                        HStack{
                            Image(systemName: "plus")
                            Text("Tambah Koleksi Baru")
                        }
                        .foregroundStyle(Color.accentColor)
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .fontWeight(.semibold)
                        .frame(width: 361, height: 48)
                        //.background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.accentColor, lineWidth: 3)
                                .cornerRadius(8)
                        )
                    }
        
                    Button(action: {
                        if selectedCollectionID == nil {
                            showAlert = true
                        } else {
                            saveToSelectedCollection()
                            dismiss()
                        }
                        }) {
                        HStack {
                            Text("Simpan")
                        }
                        .foregroundStyle(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 361, height: 48)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.background(Color.white)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(Color.white)
        .alert("Pilih Koleksi", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Silakan pilih koleksi terlebih dahulu sebelum menyimpan.")
        }
        
    }
    
    private func saveToSelectedCollection() {
        guard let selectedID = selectedCollectionID else {
            showAlert = true
            return
        }
        
        // Step 1: Delete existing items in the selected collection
        let itemsToDelete = CollctionItems.filter { $0.collection_id == selectedID }
        for item in itemsToDelete {
            modelContext.delete(item)
        }
        
        // Step 2: Insert the new items (overwrite)
        for (menuID, quantity) in order {
            let newItem = CollectionItem(
                id: Int(Date().timeIntervalSince1970 * 1000) + menuID,
                menu_id: menuID,
                quantity: quantity,
                collection_id: selectedID
            )
            modelContext.insert(newItem)
        }
        
        print("Overwritten collection ID: \(selectedID) with new order")
    }

}


//#Preview {
//    ModalView()
//}
