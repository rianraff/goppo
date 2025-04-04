
import SwiftUI

struct HomeBanner: View {
    @Binding var showReminder: Bool

    var body: some View {
        HStack {
            Text("GOPPO")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.accent)
            
            Spacer()
            
            HStack {
                Button(action: {
                    showReminder = true
                }) {
                    Text("Atur Pengingat")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundStyle(.accent)

                    Image(systemName: "bell.fill")
                        .foregroundStyle(.accent)
                }
            }
        }
    }
}


#Preview {
    HomeBanner(showReminder: .constant(false))
}
