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