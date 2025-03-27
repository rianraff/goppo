//
//  ReceiptRow.swift
//  goppo
//
//  Created by Aissya Jelitawati on 27/03/25.
//

import SwiftUI

struct ReceiptRow: View {
    var body: some View {
        HStack(spacing: 20) {
            Text("1x")
                .font(.system(size: 18, weight: .regular, design: .default))
            
            HStack {
                Text("Bakso Polos")
                    .font(.system(size: 18, weight: .regular, design: .default))
                Spacer()
            }
            
            Text("Rp25.000")
                .font(.system(size: 18, weight: .regular, design: .default))
        }
    }
}

#Preview {
    ReceiptRow()
}
