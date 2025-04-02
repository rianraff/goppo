//
//  RepeatView.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI

struct RepeatView: View {
    @State private var selectedDays: [(String, Bool)] = [
        ("Minggu", false),
        ("Senin", false),
        ("Selasa", false),
        ("Rabu", false),
        ("Kamis", false),
        ("Jumat", false),
        ("Sabtu", false)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            ForEach(0..<selectedDays.count, id: \ .self) { index in
                HStack {
                    Text("Setiap \(selectedDays[index].0)")
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: selectedDays[index].1 ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(selectedDays[index].1 ? .accentColor : .gray)
                        .onTapGesture {
                            selectedDays[index].1.toggle()
                        }
                }
            }
            Spacer()
        }
        //Navigation Title
        .navigationTitle("Atur Pengingat")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

struct RepeatView_Previews: PreviewProvider {
    static var previews: some View {
        RepeatView()
    }
}
