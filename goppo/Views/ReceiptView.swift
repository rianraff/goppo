//
//  Receipt Page.swift
//  goppo
//
//  Created by Aissya Jelitawati on 26/03/25.
//

import SwiftUI
import SwiftData

struct ReceiptView: View {
    var order: Order
    
    @State private var isSharing = false
    
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
                        ForEach(order.orderItems) { item in
                            ReceiptRow(menu: item.menu, quantity: item.quantity)
                        }
                    }
                    
                    // Total
                    HStack {
                        Text("Total Harga")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.accentColor)
                        Spacer()
                        Text("Rp \(order.totalPrice.formatted())")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.accentColor)
                    }
                }
                
                Divider()
                
                VStack (spacing: 18) {
                    // Payment Info
                    HStack {
                        Text("Informasi Pembayaran")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
                    VStack {
                        // QR Code
                        order.orderItems.first?.menu.tenant.qrisImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 240, height: 240)
                            .padding(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.accentColor, lineWidth: 2)
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
                        Text("Share Pesanan")
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 361, height: 48)
                    .background(Color.accent)
                    .cornerRadius(10)
                }
                .sheet(isPresented: $isSharing) {
                    ActivityViewController(activityItems: [order.orderSummary])
                }
                
                NavigationLink(destination: HomeView()
                    .navigationBarBackButtonHidden(true)){
                    Text("Klik untuk kembali ke halaman utama")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .underline(true, color: .gray)
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    
//}

