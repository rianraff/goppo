
import SwiftUI

struct Collection_Card: View {
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white) // Bisa diganti dengan .ultraThinMaterial untuk efek blur
            
            VStack(alignment: .leading, spacing: 10.0){
                Image("b_bakso_besar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 124, height: 124)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 4.0){
                    Text("Koleksi 1")
                        .font(.body)
                        .fontWeight(.semibold)
                    Text("Rp 15.000")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    }
                
                Button(action: {} ){
                    Text("Pesan")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 124, height: 32)
                        .background(Color.accent)
                        .cornerRadius(12)
                }
                }
            }
        .frame(width: 140, height: 232)
        
    }
}

#Preview {
    Collection_Card()
}
