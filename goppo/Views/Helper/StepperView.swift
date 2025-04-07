//
//  StepperView.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 01/04/25.
//
import SwiftUI

struct StepperView: View {
    @Binding var quantity: Int  // Use only the binding from parent
    
    let step = 1
    let range = 0...100

    var body: some View {
        HStack {
            Text("\(quantity)") // Show the actual quantity
            .foregroundStyle(.primary)
            .frame(width: 32, height: 32)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.accentColor, lineWidth: 1)
            )
            
            Stepper(value: $quantity, in: range, step: step) {
                Text("")
            }
            .labelsHidden()
        }
    }
}
