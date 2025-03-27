//
//  TimePicker.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI

struct TimePicker: View {
    
    @State private var selectedTime = Date()
    
    var body: some View {
        
        DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
            .padding()
            .background(Color.white)
            .cornerRadius(10)
    }
}

#Preview {
    TimePicker()
}
