//
//  KoleksiCard.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI
import SwiftData

struct CollectionRow: View {
    @Environment(\.modelContext) private var modelContext // Inject SwiftData context

    var collection: Collection
    var collectionItems: [CollectionItem] // List of all collection items
    var menus: [Menu]
    var tenants: [Tenant]

    var filteredItems: [CollectionItem] {
        collectionItems.filter { $0.collection_id == collection.id }
    }

    //tenant yang ditampilin sesuai dengan collection
    var tenant: Tenant? {
        guard let firstItem = filteredItems.first,
              let menu = menus.first(where: { $0.id == firstItem.menu_id }),
              let tenant = tenants.first(where: { $0.id == menu.tenant_id }) else {
            return nil
        }
        return tenant
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 15.0) {
                collection.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 97, height: 97)
                    .clipShape(Rectangle())
                    .cornerRadius(8)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 10.0) {
                    VStack(alignment: .leading) {
                        Text(collection.name)
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Text(menuItemsText()) // Dynamically show menu items
                            .font(.footnote)
                            .fontWeight(.regular)
                            .foregroundStyle(.secondary)
                    }
                    
                    HStack {
                        Text(collection.total_price, format: .number)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        if let tenant = tenant { NavigationLink(destination: Tenants_Page(tenant: tenant)){
                            Text("Pesan")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 80, height: 26)
                                .background(Color.accent)
                                .cornerRadius(8)
                        }
                        }
                    }
                }
            }
            .padding()
        }
        .frame(width: 359, height: 113)
        .background(Color.white)
        .cornerRadius(10)
    }

    private func menuItemsText() -> String {
        do {
            // Fetch all menus from SwiftData
            let storedMenus = try modelContext.fetch(FetchDescriptor<Menu>())
            
            let menuNames = filteredItems.compactMap { item in
                if let menu = storedMenus.first(where: { $0.id == item.menu_id }) {
                    return "\(item.quantity)x \(menu.name)"
                }
                return nil
            }

            return menuNames.isEmpty ? "No items" : menuNames.joined(separator: ", ")
        } catch {
            print("Error fetching menus: \(error.localizedDescription)")
            return "No items"
        }
    }
}


//#Preview {
//    let sampleCollection = Collection(
//        id: 1,
//        name: "Bakso Lovers",
//        total_price: 50_000,
//        imageName: "bakso_image"
//    )
//    
//    let sampleItems = [
//        CollectionItem(id: 1, menu_id: 1, quantity: 1, collection_id: 1),
//        CollectionItem(id: 2, menu_id: 2, quantity: 2, collection_id: 1),
//        CollectionItem(id: 3, menu_id: 3, quantity: 1, collection_id: 2) // Not part of this collection
//    ]
//
//    return CollectionRow(collection: sampleCollection, collectionItems: sampleItems)
//}
