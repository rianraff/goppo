//
//  Receipt Page.swift
//  goppo
//
//  Created by Aissya Jelitawati on 26/03/25.
//

import SwiftUI

struct ReceiptView: View {
    var order: [Int: Int]  // Received from Tenants_Page
    var menus: [Menu]  // Pass menus to match IDs

    @State private var isSharing = false
    
    var totalPrice: Int {
        order.reduce(0) { total, entry in
            let (menuID, quantity) = entry
            if let menu = menus.first(where: { $0.id == menuID }) {
                return total + (Int(menu.price) * quantity)
            }
            return total
        }
    }
    
    var orderSummary: String {
        let items = order.compactMap { (menuID, quantity) -> String? in
            if let menu = menus.first(where: { $0.id == menuID }) {
                return "\(menu.name) (\(quantity))"
            }
            return nil
        }
        
        return items.joined(separator: ", ") + "."
    }

    
    var body: some View {
            
            ScrollView {
                VStack (spacing: 24) {
                    VStack (spacing: 18) {
                        // Order Details
                        HStack {
                            Text("Detail Pemesanan")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        
                        VStack(spacing: 12) {
                            ForEach(order.keys.sorted(), id: \.self) { menuID in
                                if let menu = menus.first(where: { $0.id == menuID }) {
                                    ReceiptRow(menu: menu, quantity: order[menuID, default: 0])
                                }
                            }
                        }
                        
                        // Total
                        HStack {
                            Text("Total Harga")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.accentColor)
                            Spacer()
                            Text("Rp \(totalPrice)")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.accentColor)
                        }
                    }
                    
                    Divider()
                    
                    VStack (spacing: 18) {
                        // Payment Info
                        HStack {
                            Text("Info Pembayaran")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        
                        VStack {
                            // QR Code
                            Image("qris_dummy")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 240, height: 240)
                                .padding(6)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.accentColor, lineWidth: 3)
                                )
                            Spacer()
                        }
                    }
                    
                    // Share Button
                    Button(action: {
                                            isSharing = true
                                        }) {
                                            HStack {
                                                Image(systemName: "square.and.arrow.up")
                                                Text("Share Order")
                                            }
                                            .foregroundStyle(Color.accentColor)
                                            .frame(width: 361, height: 48)
                                            .background(Color.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.accentColor, lineWidth: 3)
                                            )
                                        }
                                        .sheet(isPresented: $isSharing) {
                                            ActivityViewController(activityItems: [orderSummary])
                                        }
                }
                .padding()
            }
    }
}

//#Preview {
//    ReceiptView()
//}
