
import SwiftUI
import SwiftData

struct HomeView: View {
    let collections: [Collection] = [
        Collection(id: 1, name: "Bakso Lovers", total_price: 50_000, imageName: "bakso_image"),
        Collection(id: 2, name: "Mie Ayam Fans", total_price: 40_000, imageName: "mie_ayam_image")
    ]
    
    let collectionItems: [CollectionItem] = [
        CollectionItem(id: 1, menu_id: 1, quantity: 1, collection_id: 1),
        CollectionItem(id: 2, menu_id: 2, quantity: 2, collection_id: 1),
        CollectionItem(id: 3, menu_id: 3, quantity: 1, collection_id: 2)
    ]
    
    @Query var tenants: [Tenant]
    @Environment(\.modelContext) private var modelContext
    
    private let columns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                Color("BackgroundColor") // Warna background
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 24.0){
                        
                        HomeBanner()
                        
                        TextField("Cari Tenant..", text: .constant(""))
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        
                        Text("Pesanan Andalanmu!")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(collections, id: \.id) { collection in
                                    Collection_Card(
                                        collection: collection,
                                        collectionItems: collectionItems
                                    )
                                }
                            }
                        }
                        
                        Text("Daftar Tenant")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        //ini jadi grid view
                        LazyVGrid(columns: columns, spacing: 8) {
                                ForEach(tenants, id: \.id) { tenant in
                                Tenant_Card(tenant: tenant)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .task {
            await seedMenuDatabase(context: modelContext)
            await seedTenantDatabase(context: modelContext)
        }
    }
}

#Preview {
    HomeView()
}
