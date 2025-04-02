
import SwiftUI

struct Tenant_Card: View {
    var tenant: Tenant
    
    var body: some View {
    
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 176.5, height: 234.5) // Pastikan ukuran tetap
            
            VStack(alignment: .leading, spacing: 10.0) {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10) // Bentuk mengikuti Rectangle
                        .fill(Color.clear)
                    
                    tenant.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Mengikuti ukuran rectangle
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .frame(width: 160.5, height: 160.5) // Ukuran tetap
                .padding(.horizontal, 8) // Padding kanan-kiri
                .padding(.top, 8) // Padding atas
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(tenant.name)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .lineLimit(2)
                    
                    HStack {
                        Image(systemName: "clock")
                            .font(.body)
                            .foregroundStyle(.gray)
                        Text(tenant.operation_time)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.horizontal, 8) // Padding kanan-kiri
                .padding(.bottom, 8) // Padding bawah
            }
        }
        .frame(width: 176.5, height: 234.5) // Pastikan frame utama tidak berubah
    }
}

#Preview {
    Tenant_Card(tenant: Tenant(id: 1, name: "Bakso Bakwan Malang", operation_time: "8.00 AM - 12.00 PM", phone_number: "08123456789", va_number: "1234567890", va_bank: "BCA", imageName: "bakso_bakwan_malang", qrisImageName: "qris_dummy"))
}
