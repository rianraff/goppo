
import SwiftUI
import SwiftData

struct HomeView: View {
    let collections: [Collection] = [
        Collection(id: 1, name: "Bakso Lovers", total_price: 50_000, imageName: "k_mie_ayam_komplit"),
        Collection(id: 2, name: "Mie Ayam Fans", total_price: 40_000, imageName: "k_mie_ayam_dino")
    ]
    
    let collectionItems: [CollectionItem] = [
        CollectionItem(id: 1, menu_id: 1, quantity: 1, collection_id: 1),
        CollectionItem(id: 2, menu_id: 2, quantity: 2, collection_id: 1),
        CollectionItem(id: 3, menu_id: 3, quantity: 1, collection_id: 2)
    ]
    
    @Query var tenants: [Tenant]
    @Query var menus: [Menu]
    
    @Environment(\.modelContext) private var modelContext
    
    private let columns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    @State private var searchText: String = ""
    @State private var showReminder = false
    
    @State private var showReminderSheet:Bool = false
    
    var filteredTenants: [Tenant] {
        if searchText.isEmpty {
            return tenants
        } else {
            return tenants.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        
        ZStack {
            Color("BackgroundColor") // Warna background
                .ignoresSafeArea()
            
            ScrollView{
                VStack(alignment: .leading, spacing: 24.0){
                    TextField("Cari Tenant..", text: $searchText)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .animation(.easeInOut(duration: 0.3), value: searchText)
                    
                    Text("Pesanan Andalanmu!")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    VStack(spacing: 10){
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(collections, id: \.id) { collection in
                                    Collection_Card(
                                        collection: collection,
                                        collectionItems: collectionItems,
                                        menus: menus,
                                        tenants: tenants
                                    )
                                }
                            }
                        }
                        
                        HStack{
                            Spacer()
                            NavigationLink(destination: CollectionView()){
                                Text("Lihat Selengkapnya")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    
                    Text("Daftar Tenant")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    //ini jadi grid view
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(filteredTenants, id: \.id) { tenant in
                            NavigationLink(destination: Tenants_Page(tenant: tenant)) {
                                Tenant_Card(tenant: tenant)
                            }
                        }
                    }
                }
                .padding()
                //            .navigationTitle("Home")
                //            .navigationBarHidden(true)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("GOPPO")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            showReminderSheet = true
                        } label: {
                            HStack(spacing: 4){
                                Text("Atur Pengingat")
                                Image(systemName: "bell.fill")
                            }
                            .font(.subheadline)
                            .foregroundStyle(.accent)
                        }
                    }
                }
                .sheet(isPresented: $showReminderSheet){
                    ReminderView(showReminder: $showReminder)
                }
                .task {
                    await seedMenuDatabase(context: modelContext)
                    await seedTenantDatabase(context: modelContext)
                }
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
