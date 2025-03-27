
import SwiftUI

struct StepperView: View {
    @State private var value = 0
    let step = 1
    let range = 0...100

    var body: some View {
        
        HStack(){
            
            ZStack{
                Color.white
                Text("\(value)")
            }
            .frame(width: 32, height: 32)
            .cornerRadius(8)
            .overlay(
            RoundedRectangle(cornerRadius: 8)
            .inset(by: 0.5)
            .stroke(Color.accent, lineWidth: 1)
            )
            
            Stepper(
                value: $value,
                in: range,
                step: step
            ) {
                Text("")
            }
            .labelsHidden()
            
//            Text("Jumlah : \(value)")
//                .font(.subheadline)
//                .foregroundStyle(.accent)
            
        }
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
    }
}

#Preview {
    Menu_Row()
}
