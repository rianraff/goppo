
import SwiftUI

struct HomeBanner: View {
    var body: some View {
        
            HStack{
                Text("GOPPO")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
                
                Spacer()
                
                HStack{
                    Text("Atur Pengingat")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundStyle(.accent)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "bell.fill")
                            .foregroundStyle(.accent)
                    }
                }
            }
    }
}

#Preview {
    HomeBanner()
}
