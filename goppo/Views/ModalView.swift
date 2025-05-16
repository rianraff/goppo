//
//  ModalCollectionView.swift
//  goppo
//
//  Created by Aissya Jelitawati on 28/03/25.
//

import SwiftUI
import SwiftData

enum AlertType {
    case belumPilihKoleksi
    case konfirmasiGantiIsi
}

struct ModalView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var collections: [Collection]
    
    @State private var selectedCollectionID: UUID? = nil
    @State private var alertType: AlertType?
    @State private var showAlert = false
    @State private var newCollectionId: UUID? = nil

    @Environment(\.dismiss) private var dismiss

    var order: Order

    private var collectionsListView: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(collections, id: \.id) { collection in
                    CollectionRadio(
                        collection: collection,
                        isSelected: selectedCollectionID == collection.uuid,
                        onTap: {
                            selectedCollectionID = collection.uuid
                        }
                    )
                }
            }
            .padding(.vertical, 4)
        }
        .frame(height: 250)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
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
                        InputCollectionNameView(newCollectionId: $newCollectionId)
                    }) {
                        HStack {
                            Image(systemName: "plus")
                            Text("Buat Koleksi Baru")
                        }
                        .foregroundStyle(Color.accentColor)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 361, height: 48)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.accentColor, lineWidth: 3)
                        )
                    }

                    Button(action: {
                        guard let selectedID = selectedCollectionID,
                              let selectedCollection = collections.first(where: { $0.uuid == selectedID }) else {
                            alertType = .belumPilihKoleksi
                            showAlert = true
                            return
                        }

                        if selectedCollection.order.orderItems.isEmpty {
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
                if let id = newValue {
                    selectedCollectionID = id
                    self.newCollectionId = nil
                    print("Auto-selected new collection: \(id)")
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 24)
        }
        .alert(isPresented: $showAlert) {
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
            default:
                return Alert(title: Text("Error"))
            }
        }
    }

    private func saveToSelectedCollection() {
        guard let selectedID = selectedCollectionID,
              let selectedCollection = collections.first(where: { $0.uuid == selectedID }) else {
            showAlert = true
            return
        }

        // Overwrite the collection's order
        selectedCollection.updateOrder(order: order)

        // Use imageName of the first menu in the order (if available)
        if let firstMenu = order.orderItems.first?.menu {
            selectedCollection.imageName = firstMenu.imageName
        }

        do {
            try modelContext.save()
            print("✅ Saved order to collection: \(selectedCollection.name)")
        } catch {
            print("❌ Error saving context: \(error)")
        }
    }

}



//#Preview {
//    ModalView()
//}
