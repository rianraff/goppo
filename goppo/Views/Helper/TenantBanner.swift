
import SwiftUI

struct Tenant_Banner: View {
    var body: some View {
        
        ZStack{
            Image("bakso_bakwan_malang")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 405, maxHeight: 200)
                .clipped()
            
            VStack(alignment: .leading){
                Text("Bakso Malang")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Text("Whatsapp : +62812345678")
                    .foregroundColor(Color.white)
                
            }
            .offset(x: -90, y: 60)
        }
    }
}

#Preview {
    Tenant_Banner()
}
