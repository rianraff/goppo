//
//  ReceiptRow.swift
//  goppo
//
//  Created by Aissya Jelitawati on 27/03/25.
//

import SwiftUI

struct ReceiptRow: View {
    var menu: Menu
    var quantity: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Text("\(quantity)x")
//                .font(.system(size: 18))
                .font(.headline)
                .fontWeight(.regular)
            
            Text(menu.name)
//                .font(.system(size: 18))
                .font(.headline)
                .fontWeight(.regular)
            
            Spacer()
            
            Text("Rp \(Int(menu.price) * quantity)")
//                .font(.system(size: 18))
                .font(.headline)
                .fontWeight(.regular)
        }
    }
}

//#Preview {
//    ReceiptRow()
//}
