
import SwiftUI

struct Collection_Card: View {
    var collection: Collection
    @Binding var selectedOrder: Order?
    @Binding var navigateToReceipt: Bool

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // Card background
            VStack(alignment: .leading, spacing: 8) {
                // Image
                GeometryReader { geometry in
                    collection.image
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.width)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .aspectRatio(1, contentMode: .fit)

                // Texts
                VStack(alignment: .leading, spacing: 4) {
                    Text(collection.name)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.primary)
                        .lineLimit(2)
                    Text("\(collection.countOrderItems()) \(collection.countOrderItems() == 1 ? "item" : "items")")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                        .fontWeight(.regular)
                        .lineLimit(2)
                }
            }
            .padding(8)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.tertiarySystemBackground))
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.accentColor, lineWidth: 1)
                }
            )
            .fixedSize(horizontal: true, vertical: false)
            .onTapGesture {
                selectedOrder = collection.order
                navigateToReceipt = true
            }

            // Ellipsis button navigates to CollectionView
            if let tenant = collection.order.orderItems.first?.menu.tenant {
                NavigationLink(destination: Tenants_Page(order: collection.order, tenant: tenant)) {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(0))
                        .foregroundStyle(.primary)
                        .frame(width: 40, height: 30)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.001))
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
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
//    return Collection_Card(collection: sampleCollection, collectionItems: sampleItems)
//}
