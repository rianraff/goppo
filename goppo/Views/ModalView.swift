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
    
    @State private var alertType: AlertType?
    @State private var showAlert = false
    
    enum AlertType {
        case belumPilihKoleksi
        case konfirmasiGantiIsi
    }
    
    @State private var newCollectionId: Int? = nil
    
    @Environment(\.dismiss) private var dismiss
    
    var order: [Int: Int]
    
    private var collectionsListView: some View {
        ScrollView {
            VStack(spacing: 2) {
                ForEach(collections, id: \.id) { collection in
                    CollectionRadio(collection: collection, isSelected: selectedCollectionID == collection.id, onTap: {
                        selectedCollectionID = collection.id
                    })
                    .onAppear {
                        print("Collection Name: \(collection.name)")
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
    }

    
    var body: some View {
        
        NavigationStack(){
            VStack(spacing: 12.0) {
                VStack (alignment: .leading, spacing: 8.0) {
                    Text("Simpan ke Koleksi")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Tambahkan menu ke koleksi pesanan andalanmu!")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                }
                .padding(.trailing)
                
                if !collections.isEmpty {
                    collectionsListView
                }
                
                VStack(spacing: 8.0) {
                    NavigationLink(destination: {
                        InputCollectionNameView(newCollectionId: $newCollectionId, order: order, menus: menus)
                    }) {
                        HStack{
                            Image(systemName: "plus")
                            Text("Buat Koleksi Baru")
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
                            alertType = .belumPilihKoleksi
                            showAlert = true
                        } else if let selectedID = selectedCollectionID, CollctionItems.filter({$0.collection_id == selectedID}).isEmpty {
                            saveToSelectedCollection()
                            dismiss()
                        } else {
                            alertType = .konfirmasiGantiIsi
                            showAlert = true
                        }
                    }) {
                        HStack {
                            Text("Simpan ke Koleksi")
                        }
                        .foregroundStyle(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 361, height: 48)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                        .disabled(selectedCollectionID == nil)
                    }
                }
                Spacer()
            }
            .onChange(of: newCollectionId) { newValue in
                if let newValue {
                    selectedCollectionID = newValue
                    print("Auto selected new collection: \(newValue)")
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
        //        .alert("Pilih Koleksi", isPresented: $showAlert) {
        //            Button("OK", role: .cancel) { }
        //        } message: {
        //            Text("Silakan buat atau pilih koleksi terlebih dahulu 😊")
        //        }
        .alert(isPresented: $showAlert) {
            if let alertType = alertType {
                switch alertType {
                case .belumPilihKoleksi:
                    return Alert(
                        title: Text("Pilih Koleksi"),
                        message: Text("Silakan buat atau pilih koleksi terlebih dahulu 😊"),
                        dismissButton: .default(Text("OK"))
                    )
                case .konfirmasiGantiIsi:
                    return Alert(
                        title: Text("Koleksimu Akan Diperbarui"),
                        message: Text("Isi koleksi yang lama akan diganti dengan yang baru. Lanjutkan? 🔄"),
                        primaryButton: .default(Text("Perbarui Koleksi")) {
                            saveToSelectedCollection()
                            dismiss()
                        },
                        secondaryButton: .cancel(Text("Batal"))
                    )
                }
            } else {
                // fallback kalau alertType ternyata nil, misalnya log error (opsional)
                return Alert(title: Text("Error"))
            }
        }


    }
    
    private func saveToSelectedCollection() {
        guard let selectedID = selectedCollectionID else {
            showAlert = true
            return
        }
        
        // Delete existing items in the selected collection
        let itemsToDelete = CollctionItems.filter { $0.collection_id == selectedID }
        for item in itemsToDelete {
            modelContext.delete(item)
        }
        
        var totalPrice = 0.0  // Variable to hold total price of current collection
        var imageName = ""   // Variable to hold the imageName of first menu item in the order

        for (menuID, quantity) in order {
            guard let menu = menus.first(where: { $0.id == menuID }) else { continue }
            
            let newItem = CollectionItem(
                id: Int(Date().timeIntervalSince1970 * 1000) + menuID,
                menu_id: menuID,
                quantity: quantity,
                collection_id: selectedID
            )
            modelContext.insert(newItem)
            
            // Calculate total price for each menu item and add it to the totalPrice variable
            totalPrice += (menu.price) * Double(quantity)
            
            // Set imageName of first menu in order (Assume that there's only one menu per collection)
            if imageName == "" {
                imageName = menu.imageName
            }
        }
        
        print("Overwritten collection ID: \(selectedID) with new order")
        
        // Now you have total_price, use it as required
        
        // Update the total_price of selected Collection in your data model and imageName
        do {
            if let collection = collections.first(where: { $0.id == selectedID }) {
                collection.total_price = totalPrice
                collection.imageName = imageName    // Set new imageName for collection
                try modelContext.save()
            }
        } catch {
            print("Error saving the context: \(error)")
        }
    }
    
}


//#Preview {
//    ModalView()
//}
