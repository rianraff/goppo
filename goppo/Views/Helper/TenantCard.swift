
import SwiftUI

struct Tenant_Card: View {
    var tenant: Tenant
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white) 
            
            VStack(alignment: .leading, spacing: 10.0){
                tenant.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160.5, height: 160.5)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 4.0){
                    Text(tenant.name)
                        .font(.body)
                        .fontWeight(.semibold)
                    HStack{ Image(systemName: "clock")
                        .font(.body)
                        .foregroundStyle(.secondary)
                        Text(tenant.operation_time)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .frame(width: 176.5, height: 234.5)
    }
}

#Preview {
    Tenant_Card(tenant: Tenant(id: 1, name: "Bakso Malang", operation_time: "8.00 AM - 12.00 PM", phone_number: "08123456789", va_number: "1234567890", va_bank: "BCA", imageName: "bakso_bakwan_malang", qrisImageName: "qris_dummy"))
}
