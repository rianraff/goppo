import SwiftUI
import SwiftData

struct Tenants_Page: View {
    @State private var selectedCategory = 0
    @State private var order: [Int: Int] = [:]
    @Environment(\.modelContext) private var modelContext
    @State private var showModal = false
    
    var tenant: Tenant
    @Query var menus: [Menu]
    
    init(tenant: Tenant, initialOrder: [Int: Int] = [:]) {
            self.tenant = tenant
            self._order = State(initialValue: initialOrder)
        }

    // Compute total price
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
                Spacer()
                
                Tenant_Banner(tenant: tenant)
                
                VStack(alignment: .leading, spacing: 16.0) {
                    Text("Daftar Menu")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    // Picker for Filtering
                    Picker("Category", selection: $selectedCategory) {
                        Text("Semua").tag(0)
                        Text("Makanan").tag(1)
                        Text("Minuman").tag(2)
                    }
                    .pickerStyle(.segmented)
                    
//                    ScrollView {
//                        VStack {
//                            ForEach(menus.filter { menu in
//                                menu.tenant_id == tenant.id &&
//                                (selectedCategory == 0 || (selectedCategory == 1 && menu.category == "food") || (selectedCategory == 2 && menu.category == "drink"))
//                            }, id: \.id) { menu in
//                                Menu_Row(menu: menu, quantity: binding(for: menu.id))
//                            }
//                        }
//                    }
                    
                    ScrollView{
                        VStack{
                            let filteredMenus = menus.filter { menu in
                                menu.tenant_id == tenant.id &&
                                (selectedCategory == 0 || (selectedCategory == 1 && menu.category == "food") || (selectedCategory == 2 && menu.category == "drink"))
                            }
                            
                            if filteredMenus.isEmpty {
                                Text("Menu belum tersedia")
                                    .foregroundStyle(.secondary)
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            } else {
                                ForEach(filteredMenus, id: \.id){ menu in Menu_Row(menu: menu, quantity: binding(for: menu.id))
                                }
                            }
                        }
                    }
                    
                    // Action Buttons
                    HStack {
                        Button(action: {
                            showModal.toggle()
                        }) {
                            Image(systemName: "bookmark")
                                .font(.system(size: 20))
                                .frame(width: 44, height: 44)
                                .background(Color.accentColor)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .disabled(order.isEmpty)
                        .sheet(isPresented: $showModal) {
                            ModalView(order: order)
                                .presentationDetents([.height(500)])
                                .presentationDragIndicator(.visible)
                        }
                        
                        
                        NavigationLink(destination: ReceiptView(order: order)) {
                            HStack {
                                Text("Lihat Pesanan")
                                Spacer()
                                Text("Rp \(totalPrice)")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .frame(height: 44)
                            .background(Color.accentColor)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                        }
                        .disabled(order.isEmpty)
                    }
                    //Navigation Title
                    .navigationTitle("Tenant")
                    .navigationBarTitleDisplayMode(.inline)
                    .padding()
                }
                .padding()
            }
    }

    private func binding(for menuID: Int) -> Binding<Int> {
        return Binding(
            get: { order[menuID, default: 0] },
            set: { newQuantity in
                if newQuantity > 0 {
                    order[menuID] = newQuantity
                } else {
                    order.removeValue(forKey: menuID) // Removes the item when quantity is 0
                }
            }
        )
    }

}

#Preview {
    Tenants_Page(
        tenant: Tenant(
            id: 1,
            name: "Kedai Aneka Rasa",
            operation_time: "08.00 - 14.00",
            phone_number: "085777329932",
            va_number: "123456",
            va_bank: "BCA",
            imageName: "kedai_aneka_rasa",
            qrisImageName: "qris_kedai_aneka_rasa"
        ),
        initialOrder: [:] // <- just pass an empty dictionary or some example data like [1: 2, 2: 1]
    )
}
