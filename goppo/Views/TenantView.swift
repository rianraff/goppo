import SwiftUI
import SwiftData

struct Tenants_Page: View {

    @State private var selectedCategory = 0
    @State private var order: [Int: Int] = [:] // Dictionary to store order count
    @Environment(\.modelContext) private var modelContext
    
    var tenant: Tenant
    @Query var menus: [Menu]

    // Filtering menus based on selected category
    var filteredMenu: [Menu] {
        menus.filter { menu in
            menu.tenant_id == tenant.id &&
            (selectedCategory == 0 || (selectedCategory == 1 && menu.category == "food") || (selectedCategory == 2 && menu.category == "drink"))
        }
    }
    
    var totalPrice: Int {
        order.reduce(0) { total, entry in
            let (menuID, quantity) = entry
            if let menu = menus.first(where: { $0.id == menuID }) {
                return total + (Int(menu.price) * quantity)
            }
            return total
        }
    }

    var body: some View {
        VStack {
            // Back Navigation Header
            HStack {
                Image(systemName: "chevron.backward")
                Spacer()
                Text("Tenant")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            Tenant_Banner(tenant: tenant)
            
            VStack(alignment: .leading, spacing: 16.0) {
                Text("Daftar Menu")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                // Picker for Filtering
                Picker("Category", selection: $selectedCategory) {
                    Text("Semua").tag(0)   // Show all
                    Text("Makanan").tag(1) // Food
                    Text("Minuman").tag(2) // Drink
                }
                .pickerStyle(.segmented)
                
                ScrollView {
                    VStack {
                        ForEach(filteredMenu, id: \.id) { menu in
                            Menu_Row(menu: menu, quantity: binding(for: menu.id))
                        }
                    }
                }
                
                // Action Buttons
                HStack {
                    Button(action: {
                        // Bookmark action
                    }) {
                        Image(systemName: "bookmark")
                            .font(.system(size: 20))
                            .frame(width: 44, height: 44)
                            .background(Color.accentColor)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    Button(action: {
                        // Receipt action
                    }) {
                        HStack {
                            Text("See Receipt")
                            Spacer()
                            Text(totalPrice, format: .number)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .frame(height: 44)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .onChange(of: order) { oldOrder, newOrder in
            print("Order changed from \(oldOrder) to \(newOrder)")
        }

    }

    // ✅ Binding Helper Function
    private func binding(for menuID: Int) -> Binding<Int> {
        return Binding(
            get: { order[menuID, default: 0] },
            set: { order[menuID] = $0 }
        )
    }
}


#Preview {
    Tenants_Page(tenant: Tenant(id: 1,
                                name: "Kedai Aneka Rasa",
                                operation_time: "08.00 - 14.00",
                                phone_number: "kedai_aneka_rasa",
                                va_number: "085777329932",
                                va_bank: "qris_kedai_aneka_rasa",
                                imageName : "123456",
                                qrisImageName : "BCA"
                               )
    )
}
