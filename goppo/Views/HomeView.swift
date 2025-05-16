
import SwiftUI
import SwiftData
import Combine

struct HomeView: View {
    
    @Query var collections: [Collection]
    @Query var tenants: [Tenant]
    
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var appState: AppState
    
    private let columns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    @State private var searchText: String = ""
    @State private var showReminder = false
    @State private var showReminderSheet:Bool = false
    
    @State var selectedOrder: Order? = nil
    @State private var navigateToReceipt: Bool = false
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                Color("BackgroundColor")
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
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 12) {
                                            ForEach(collections, id: \.id) { collection in
                                                Collection_Card(collection: collection,
                                                                selectedOrder: $selectedOrder,
                                                                navigateToReceipt: $navigateToReceipt)
                                            }
                                        }
                                        .padding(.horizontal, 2)
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
                                .frame(height: 225)
                            }
                        }
                        
                        Text("Daftar Tenant")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(tenants, id: \.id) { tenant in
                                Tenant_Card(tenant: tenant, order: Order(orderItems: [OrderItem]()))
                            }
                        }
                        
                    }
                    .padding()
                    .sheet(isPresented: $showReminderSheet){
                        ReminderView(showReminder: $showReminder)
                    }
                }
                
            }
            
            NavigationLink(
                destination: selectedOrder.map { ReceiptView(order: $0) },
                isActive: $navigateToReceipt
            ) {
                EmptyView()
            }
            .hidden()
        }
        .onAppear {
            // Check if we have a pending order to display from an intent
            if let pendingOrder = appState.pendingSelectedOrder, appState.shouldNavigateToReceipt {
                self.selectedOrder = pendingOrder
                self.navigateToReceipt = true
                
                // Reset the flags once we've handled them
                appState.pendingSelectedOrder = nil
                appState.shouldNavigateToReceipt = false
            }
        }
    }
}
