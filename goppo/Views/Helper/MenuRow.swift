
import SwiftUI

struct StepperView: View {
    @State private var value = 0
    let step = 1
    let range = 0...100

    var body: some View {
        
        VStack(alignment: .trailing){
            Stepper(
                value: $value,
                in: range,
                step: step
            ) {
                Text("")
            }
            
            Text("Jumlah : \(value)")
                .font(.subheadline)
        }
        .padding(10)
    }
}

struct Menu_Row: View {

var body: some View {
        HStack{
            
            Image("b_bakso_besar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .clipShape(Rectangle())
                .cornerRadius(8)
                .clipped()
            
            VStack(alignment: .leading){
                Text("Bakso Besar")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                Text("Rp 28.000")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            StepperView()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    Menu_Row()
}
