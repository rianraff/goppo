//
//  Receipt Page.swift
//  goppo
//
//  Created by Aissya Jelitawati on 26/03/25.
//

import SwiftUI

struct ReceiptView: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.backward")
            Spacer()
            Text("Tenant")
                .font(.headline)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding()
        
        ScrollView {
            VStack (spacing: 24) {
                VStack (spacing: 18) {
                    //Judul Detail Pemesanan
                    HStack {
                        Text("Detail Pemesanan")
                            .font(.system(size: 22, weight: .bold, design: .default))
                        Spacer()
                    }
                    
                    //Detail Order
                    VStack(spacing: 12) {
                        ReceiptRow()
                        ReceiptRow()
                        ReceiptRow()
                    }
                    
                    //Total
                    HStack {
                        Text("Total Harga")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundStyle(Color.accentColor)
                        Spacer()
                        Text("Rp25.000")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundStyle(Color.accentColor)
                    }
                }
                
                Divider()
                
                VStack (spacing: 18) {
                    //Judul Info Pembayaran
                    HStack {
                        Text("Info Pembayaran")
                            .font(.system(size: 22, weight: .bold, design: .default))
                        Spacer()
                    }
                    
                    VStack {
                        //Judul QR
                        HStack {
                            Text("Barcode QR")
                                .font(.system(size: 18, weight: .semibold, design: .default))
                            Spacer()
                        }
                        
                        
                        //QR
                        Image("qris_dummy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 240, height: 240)
                            .padding(6)
                            .overlay (
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.accentColor, lineWidth: 3)
                                    .cornerRadius(8))
                        Spacer()
                    }
                    
                    VStack {
                        //Judul VA
                        HStack {
                            Text("Virtual Account")
                                .font(.system(size: 18, weight: .semibold, design: .default))
                            Spacer()
                        }
                        
                        //VA
                        HStack {
                            ZStack {
                                HStack {
                                    Text("1234567890XXXX")
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                .frame(width: 272, height: 40)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                            }
                            
                            ZStack {
                                Button(action: {} ){
                                    HStack {
                                        Text("Copy")
                                            .foregroundStyle(Color.white)
                                            .font(.system(size: 16, weight: .semibold, design: .default))
                                    }
                                    .frame(width: 80, height: 40)
                                    .background(Color.accentColor)
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                }
                
                //Button
                Button(action: {} ){
                    HStack{
                        Image(systemName: "square.and.arrow.up")
                        Text("Share Order")
                    }
                    .foregroundStyle(Color.accentColor)
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .fontWeight(.semibold)
                    .frame(width: 361, height: 48)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.accentColor, lineWidth: 3)
                            .cornerRadius(8)
                    )
                }
                
            }
            .padding(.horizontal, 16.0)
        }
    }
}

#Preview {
    ReceiptView()
}
