
import SwiftUI

struct Tenant_Banner: View {
    var tenant: Tenant
    var body: some View {
        
        ZStack(alignment: .bottomLeading){
            tenant.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 405, maxHeight: 200)
                .overlay(
                    Color.black.opacity(0.5)
                )
                .clipped()
            
            VStack(alignment: .leading){
                Text(tenant.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Text("Whatsapp : \(tenant.phone_number)")
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    Tenant_Banner(tenant: Tenant(id: 1,
                                 name: "Kedai Aneka Rasa",
                                 operation_time: "08.00 - 14.00",
                                 phone_number: "085777129912",
                                 va_number: "085777329932",
                                 va_bank: "qris_kedai_aneka_rasa",
                                 imageName : "kedai_aneka_rasa",
                                 qrisImageName : "BCA"
                                )
     )
}
