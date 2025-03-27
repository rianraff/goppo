
import SwiftUI

struct Tenants_Page: View {
    @State private var selectedCategory = 0
    
    var body: some View {
        
            HStack{
                Image(systemName: "chevron.backward")
                
                Spacer()
                
                Text("Tenant")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding()
            
            Tenant_Banner()
            
            HStack{
                Text("Daftar Menu")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding([.top, .leading, .trailing])
            
            
            Picker("Category", selection: $selectedCategory) {
                Text("Semua").tag(0)
                Text("Makanan").tag(1)
                Text("Minuman").tag(2)
            }
            .pickerStyle(.segmented)
            .padding()
            
        ScrollView{
            VStack {
                ForEach(0..<5, id: \.self) { _ in
                    Menu_Row()
                }
            }
        }
            
            HStack{
                Button(action: {
                }) {
                    Image(systemName: "bookmark")
                        .font(.system(size: 20))
                        .frame(width: 44, height: 44)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Button(action: {
                    // Action saat tombol ditekan
                }) {
                    HStack {
                        Text("See Receipt")
                        Spacer()
                        Text("Rp 15.000")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity) // Agar button melebar
                    .padding()
                    .background(Color.accentColor)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                }
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    Tenants_Page()
}
