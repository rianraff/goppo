
import SwiftUI

struct Tenant_Card: View {
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white) 
            
            VStack(alignment: .leading, spacing: 10.0){
                Image("bakso_bakwan_malang")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160.5, height: 160.5)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 4.0){
                    Text("Bakso Malang")
                        .font(.body)
                        .fontWeight(.semibold)
                    HStack{ Image(systemName: "clock")
                        .font(.body)
                        .foregroundStyle(.secondary)
                    Text("8.00 AM - 12.00 PM")
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
    Tenant_Card()
}
