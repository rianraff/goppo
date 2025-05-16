import SwiftUI
import SwiftData

struct Tenants_Page: View {
    @State private var selectedCategory: MenuCategory? = nil
    @Environment(\.modelContext) private var modelContext
    @State private var showModal = false
    @State var order: Order
    
    var tenant: Tenant
    
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
                    Text("Semua").tag(nil as MenuCategory?)
                    Text("Makanan").tag(MenuCategory.food as MenuCategory?)
                    Text("Minuman").tag(MenuCategory.drink as MenuCategory?)
                }
                .pickerStyle(.segmented)
                
                ScrollView{
                    VStack{
                        let filteredMenus = tenant.menus.filter { menu in
                            guard let selected = selectedCategory else {
                                return true // Show all if "Semua" is selected
                            }
                            return menu.category == selected
                        }
                        
                        if filteredMenus.isEmpty {
                            Text("Menu belum tersedia")
                                .foregroundStyle(.secondary)
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxWidth: .infinity)
                        } else {
                            ForEach(filteredMenus.sorted(by: { $0.price > $1.price}), id: \.id){ menu in Menu_Row(menu: menu, order: $order)
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
                            Text("Rp \(order.totalPrice.formatted())")
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
    
}

//#Preview {
//    Tenants_Page(
//        tenant: Tenant(
//            id: 1,
//            name: "Kedai Aneka Rasa",
//            operation_time: "08.00 - 14.00",
//            phone_number: "085777329932",
//            va_number: "123456",
//            va_bank: "BCA",
//            imageName: "kedai_aneka_rasa",
//            qrisImageName: "qris_kedai_aneka_rasa"
//        ),
//        initialOrder: [:] // <- just pass an empty dictionary or some example data like [1: 2, 2: 1]
//    )
//}
