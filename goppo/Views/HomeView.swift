
import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Query var collections: [Collection]
    @Query var collectionItems: [CollectionItem]
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
            
            ScrollView(){
                VStack(alignment: .leading, spacing: 24.0){
                    TextField("Cari Tenant", text: $searchText)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .animation(.easeInOut(duration: 0.3), value: searchText)
                    
                    if searchText.isEmpty{
                        Text("Pesanan Andalanmu!")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        if collections.isEmpty {
                            
                            Text("Belum ada koleksi yang dibuat")
                                .foregroundStyle(.secondary)
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxWidth: .infinity, minHeight: 100)
                                .background(Color(.tertiarySystemBackground))
                                .cornerRadius(10)
                            
                        }
                        else {
                            
                            VStack(alignment: .leading, spacing: 10){
                                
                                // get collectionIds from collectionItems
                                let collectionItemCollectionIDs = collectionItems.map(\.collection_id)
                                HStack {
                                    ForEach(
                                        collections
                                            .filter { collectionItemCollectionIDs.contains($0.id) }
                                            .prefix(3),
                                        id: \.id
                                    ) { collection in
                                        Collection_Card(collection: collection, collectionItems: collectionItems, menus: menus, tenants: tenants)
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
                        }
                    }
                    
                    Text("Daftar Tenant")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    //ini jadi grid view
                    
                    if filteredTenants.isEmpty {
                        Text("Tenant tidak ditemukan")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                    } else {
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(filteredTenants.sorted(by: {$0.name < $1.name}), id: \.id) { tenant in
                                NavigationLink(destination: Tenants_Page(tenant: tenant)) {
                                    Tenant_Card(tenant: tenant)
                                }
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
