
import SwiftUI

struct HomeView: View {
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
                                Collection_Card()
                                Collection_Card()
                                Collection_Card()
                            }
                        }
                        
                        Text("Daftar Tenant")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        //ini jadi grid view
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(0..<4, id: \.self) { _ in
                                Tenant_Card()
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
