
import SwiftUI

struct Menu_Row: View {
    var menu: Menu
    @Binding var quantity: Int

var body: some View {
        HStack{
            
            menu.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .clipShape(Rectangle())
                .cornerRadius(8)
                .clipped()
            
            VStack(alignment: .leading){
                Text(menu.name)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                Text("Rp \(menu.price, format: .number.precision(.fractionLength(0)))")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            StepperView(quantity: $quantity)
        }
    }
}

#Preview {
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
}
