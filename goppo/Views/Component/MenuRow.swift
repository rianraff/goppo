
import SwiftUI

struct Menu_Row: View {
    var menu: Menu
    @Binding var order: Order

    var body: some View {
        HStack {
            menu.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .clipShape(Rectangle())
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(menu.name)
                    .font(.subheadline)
                Text("Rp \(menu.price, format: .number.precision(.fractionLength(0)))")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()

            StepperView(quantity: Binding(
                get: {
                    order.quantity(for: menu)
                },
                set: { newValue in
                    order.setQuantity(for: menu, quantity: newValue)
                }
            ))
        }
    }
}


//#Preview {
//    @Binding var quantity: Int
//    
//    Menu_Row(menu:
//                Menu(id: 1,
//                        name: "Mie Ayam Komplit",
//                        price: 25000,
//                        imageName: "k_mie_ayam_komplit",
//                        category: "food",
//                        tenant_id: 1),
//             quantity: $quantity
//    )
//}
