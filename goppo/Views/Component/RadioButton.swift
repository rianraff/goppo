//
//  RadioButton.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 07/04/25.
//

import SwiftUI

struct RadioButton: View {
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
        Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
            .foregroundColor(isSelected ? .accentColor : .gray)
            .font(.system(size: 14))
            .imageScale(.large)
            .accessibilityLabel(isSelected ? "Terpilih" : "Tidak terpilih")
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}
