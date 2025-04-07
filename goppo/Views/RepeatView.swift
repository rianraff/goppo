//
//  RepeatView.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI

struct RepeatView: View {
    
    @Binding var repeatDays: [String]

    let weekdays = [
        ("Sun", "Minggu"), ("Mon", "Senin"), ("Tue", "Selasa"),
        ("Wed", "Rabu"), ("Thu", "Kamis"), ("Fri", "Jumat"), ("Sat", "Sabtu")
    ]

    var body: some View {
        List {
            ForEach(weekdays, id: \.0) { (short, name) in
                Button {
                    toggleDay(short)
                } label: {
                    HStack {
                        Text(name)
                            .foregroundStyle(Color.primary)
                        Spacer()
                        if repeatDays.contains(short) {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.accent)
                        }
                    }
                }
            }
        }
        .navigationTitle("Ulangi Setiap")
        .navigationBarTitleDisplayMode(.inline)
    }

    func toggleDay(_ day: String) {
        if repeatDays.contains(day) {
            repeatDays.removeAll { $0 == day }
        } else {
            repeatDays.append(day)
        }
    }
}

#Preview {
    RepeatView(repeatDays: .constant(["Mon", "Wed"]))
}
